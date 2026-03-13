<?php
/**
 * fbscraper.php - Core Logic
 * Converts HAR data to CSV using native PHP.
 */

function findAllNodes($obj, $targetKeys, $maxDepth = 50)
{
    if (!is_array($obj) && !is_object($obj))
        return [];

    $results = [];
    $stack = [['o' => $obj, 'd' => 0]];

    while (count($stack) > 0) {
        $item = array_pop($stack);
        $o = $item['o'];
        $d = $item['d'];

        if (!is_array($o) && !is_object($o))
            continue;
        if ($d > $maxDepth)
            continue;

        foreach ($o as $key => $val) {
            if (in_array($key, $targetKeys)) {
                $results[] = $val;
            }
            if (is_array($val) || is_object($val)) {
                $stack[] = ['o' => $val, 'd' => $d + 1];
            }
        }
    }
    return $results;
}

function extractFeedback($node)
{
    // Try to find the most relevant feedback object
    // It's often nested under 'feedback', 'comet_ufi_summary_and_actions_renderer', etc.
    // Increase depth significantly to catch nested feedback structures
    $feedbacks = findAllNodes($node, ['feedback'], 40);

    $stats = [
        'likes' => 0,
        'love' => 0,
        'haha' => 0,
        'wow' => 0,
        'sad' => 0,
        'angry' => 0,
        'care' => 0,
        'comments' => 0,
        'shares' => 0
    ];

    foreach ($feedbacks as $f) {
        if (isset($f['reaction_count']['count'])) {
            $stats['likes'] = max($stats['likes'], (int)$f['reaction_count']['count']);
        }
        elseif (isset($f['i18n_reaction_count'])) {
            // Handle "1.2K" etc strictly if needed, but mostly it's raw numbers in JSON
            $stats['likes'] = max($stats['likes'], (int)filter_var($f['i18n_reaction_count'], FILTER_SANITIZE_NUMBER_INT));
        }

        // Detailed Reactions (Top Reactions)
        if (isset($f['top_reactions']['edges']) && is_array($f['top_reactions']['edges'])) {
            foreach ($f['top_reactions']['edges'] as $edge) {
                // Determine name based on localized_name (fallback to safe defaults if English)
                // Note: Localized names depend on the user's locale in HAR. 
                // We assume standard English names or match loosely.
                $reactionName = strtolower($edge['node']['localized_name'] ?? '');
                $count = (int)($edge['reaction_count'] ?? 0);

                if (isset($stats[$reactionName])) {
                    $stats[$reactionName] = max($stats[$reactionName], $count);
                }
            }
        }

        // Comment Count Detection
        if (isset($f['total_comment_count'])) {
            $stats['comments'] = max($stats['comments'], (int)$f['total_comment_count']);
        }
        elseif (isset($f['comment_count']['total_count'])) {
            $stats['comments'] = max($stats['comments'], (int)$f['comment_count']['total_count']);
        }
        else {
            // Check for comet style nesting: comment_rendering_instance -> comments -> total_count
            $deepComments = findAllNodes($f, ['total_count'], 5);
            foreach ($deepComments as $dc) {
                if (is_numeric($dc))
                    $stats['comments'] = max($stats['comments'], (int)$dc);
            }
        }

        if (isset($f['share_count']['count'])) {
            $stats['shares'] = max($stats['shares'], (int)$f['share_count']['count']);
        }
        elseif (isset($f['share_count_reduced'])) {
            $stats['shares'] = max($stats['shares'], (int)filter_var($f['share_count_reduced'], FILTER_SANITIZE_NUMBER_INT));
        }
    }
    return $stats;
}

function findDate($node)
{
    // Search deep for time keys (up to depth 15, to catch deeply nested creation_time)
    $candidates = findAllNodes($node, ['creation_time', 'publish_time'], 15);

    $best = 0;
    foreach ($candidates as $time) {
        if (is_numeric($time) && $time > 0) {
            // Filter out future dates or impossibly old dates
            // Assuming HAR is recent (2000-2030)
            // But sometimes timestamps are milliseconds.
            // If > 20000000000 (year ~2600), treat as ms.
            if ($time > 20000000000)
                $time = $time / 1000;

            // We want the most plausible timestamp.
            // Usually any valid timestamp is good.
            if ($best == 0)
                $best = $time;
            else {
                // Heuristic: prefer earlier time? Or later?
                // Often 'creation_time' is earlier than 'publish_time' for edits?
                // Let's stick to first valid found for simplicity, or max?
                // Let's prefer the one closest to now? 
                // Or simply max to get the latest update time?
                // Actually, creation_time is usually what we want.
                // Let's take the minimum non-zero value to get the original creation time?
                if ($time < $best)
                    $best = $time;
            }
        }
    }
    return $best;
}

function extractUserProfile($actor)
{
    $profile = [
        'id' => $actor['id'] ?? '',
        'name' => $actor['name'] ?? ($actor['text'] ?? ($actor['label'] ?? ($actor['short_name'] ?? 'Unknown'))),
        'url' => $actor['url'] ?? ($actor['uri'] ?? ("https://facebook.com/" . ($actor['id'] ?? ''))),
        'is_verified' => (isset($actor['is_verified']) && $actor['is_verified']) || 
                         (isset($actor['verification_status']) && $actor['verification_status'] === 'VERIFIED') ||
                         (isset($actor['__typename']) && strpos($actor['__typename'], 'VerifiedBadge') !== false)
                         ? 'Yes' : 'No',
        'pic' => ''
    ];

    // Aggressive search for picture URI - prioritize specific keys first
    $specificKeys = ['profile_picture', 'profile_photo', 'profile_pic', 'displayPicture', 'avatar', 'profileImage'];
    $genericKeys = ['image', 'picture'];

    // First pass: Specific Keys
    $nodes = findAllNodes($actor, $specificKeys, 15);
    foreach ($nodes as $n) {
        if (is_array($n)) {
            $uri = $n['uri'] ?? ($n['url'] ?? ($n['src'] ?? ''));
            if ($uri && strpos($uri, 'http') === 0) {
                $profile['pic'] = $uri;
                break;
            }
        }
        elseif (is_string($n) && strpos($n, 'http') === 0) {
            $profile['pic'] = $n;
            break;
        }
    }

    // Second pass: Generic Keys (only if no pic found yet)
    if (empty($profile['pic'])) {
        $nodes = findAllNodes($actor, $genericKeys, 10);
        foreach ($nodes as $n) {
            if (is_array($n)) {
                $uri = $n['uri'] ?? ($n['url'] ?? ($n['src'] ?? ''));
                if ($uri && strpos($uri, 'http') === 0) {
                    $profile['pic'] = $uri;
                    break;
                }
            }
            elseif (is_string($n) && strpos($n, 'http') === 0) {
                $profile['pic'] = $n;
                break;
            }
        }
    }

    return $profile;
}

function extractMedia($node)
{
    $media = [];
    $seen = [];

    // Search DEEPLY for specific image keys directly, bypassing attachment wrappers
    // which seemed unreliable in some HAR structures.
    // Depth 50 to catch everything.
    $images = findAllNodes($node, ['image', 'photo_image', 'original_image', 'large_share_image'], 50);

    foreach ($images as $img) {
        $uri = $img['uri'] ?? ($img['url'] ?? ($img['src'] ?? null));

        // Filter out tiny tracking pixels or icons if needed
        // (But usually FB image URLs are distinct)
        if ($uri && !isset($seen[$uri]) && strpos($uri, 'http') === 0) {
            $media[] = $uri;
            $seen[$uri] = true;
        }
    }

    // Direct video URLs
    // playable_url_quality_hd is often a direct key in the node
    $videos = findAllNodes($node, ['playable_url_quality_hd', 'playable_url'], 50);
    foreach ($videos as $v) {
        if (is_string($v) && strpos($v, 'http') === 0 && !isset($seen[$v])) {
            $media[] = $v;
            $seen[$v] = true;
        }
    }

    return implode("; ", $media);
}

function processHarFile($harPath, $uploadDir)
{
    $harName = pathinfo($harPath, PATHINFO_FILENAME);
    $timestamp = date("YmdHis");

    $jsonData = json_decode(file_get_contents($harPath), true);
    if (!$jsonData)
        return ["status" => "error", "message" => "Invalid JSON in HAR file"];

    $posts = [];
    $users = [];

    $entries = $jsonData['log']['entries'] ?? [];

    foreach ($entries as $entry) {
        $text = $entry['response']['content']['text'] ?? '';
        if (empty($text))
            continue;

        $dataObjects = [];

        $cleanText = $text;
        if (substr($text, 0, 9) === "for (;;);") {
            $cleanText = substr($text, 9);
        }

        $firstTry = json_decode($cleanText, true);
        if ($firstTry) {
            $dataObjects[] = $firstTry;
        }
        else {
            $lines = explode("\n", $text);
            foreach ($lines as $line) {
                if (trim($line) === '')
                    continue;
                $d = json_decode($line, true);
                if ($d)
                    $dataObjects[] = $d;
            }
        }

        foreach ($dataObjects as $data) {
            // 1. Global User Discovery (Search for user-like objects anywhere in the data)
            $userKeys = ['user', 'actor', 'actors', 'author', 'participant', 'owner', 'entity', 'owning_profile', 'creator', 'messaging_sender'];
            $potentialUsers = findAllNodes($data, $userKeys, 20);

            foreach ($potentialUsers as $u) {
                $items = is_array($u) && isset($u[0]) ? $u : [$u];
                foreach ($items as $actor) {
                    if (!is_array($actor) || empty($actor['id']) || !is_numeric($actor['id']))
                        continue;

                    $profile = extractUserProfile($actor);
                    $uid = $actor['id'];

                    // Skip Anonymous participants or things that look like Hashtags/Groups
                    $nameLower = strtolower($profile['name']);
                    if (strpos($nameLower, 'anonymous participant') !== false ||
                    strpos($profile['url'], '/hashtag/') !== false ||
                    strpos($profile['url'], '/groups/') !== false) {
                        continue;
                    }

                    // For broad discovery, if we have NO name and NO pic, it's probably junk
                    // UNLESS they are verified!
                    if (($profile['name'] === 'Unknown' || empty($profile['name'])) && empty($profile['pic']) && $profile['is_verified'] !== 'Yes') {
                        continue;
                    }

                    $shouldUpdate = false;
                    if (!isset($users[$uid])) {
                        $shouldUpdate = true;
                    }
                    elseif (empty($users[$uid]['profile_pic']) && !empty($profile['pic'])) {
                        $shouldUpdate = true;
                    }
                    elseif (($users[$uid]['is_verified'] ?? 'No') === 'No' && $profile['is_verified'] === 'Yes') {
                        $shouldUpdate = true;
                    }

                    if ($shouldUpdate) {
                        $existing = $users[$uid] ?? [];
                        $users[$uid] = [
                            'user_id' => $profile['id'],
                            'user_name' => !empty($profile['name']) && $profile['name'] !== 'Unknown' ? $profile['name'] : ($existing['user_name'] ?? 'Unknown'),
                            'profile_url' => $profile['url'],
                            'is_verified' => $profile['is_verified'] === 'Yes' ? 'Yes' : ($existing['is_verified'] ?? 'No'),
                            'profile_pic' => !empty($profile['pic']) ? $profile['pic'] : ($existing['profile_pic'] ?? '')
                        ];
                    }
                }
            }

            // 2. Post Extraction
            $nodes = array_merge(
                findAllNodes($data, ['node']),
                findAllNodes($data, ['story'])
            );

            foreach ($nodes as $n) {
                // Extract Post Data (Strictly BigInt IDs only)
                $id = $n['post_id'] ?? ($n['id'] ?? null);
                if (!$id || strlen((string)$id) < 5 || !is_numeric($id))
                    continue;

                // Ensure it's a valid post content-like node
                if (!isset($n['actors']) && !isset($n['message']) && !isset($n['comet_sections']) && !isset($n['feedback']))
                    continue;

                // Extract metrics and media
                $metrics = extractFeedback($n);
                $mediaUrls = extractMedia($n);
                $timestamp_post = findDate($n);

                // Deep extract text body
                $textBody = $n['message']['text'] ?? "";
                if (empty($textBody)) {
                    $allText = findAllNodes($n, ['message'], 20);
                    foreach ($allText as $mt) {
                        if (isset($mt['text']) && !empty($mt['text'])) {
                            $textBody = $mt['text'];
                            break;
                        }
                    }
                }

                $author = findAllNodes($n, ['actors'])[0][0] ?? [];
                
                // Enhanced Verification Check for Comet
                $isAuthorVerified = (isset($author['is_verified']) && $author['is_verified']) || (isset($author['verification_status']) && $author['verification_status'] === 'VERIFIED');
                if (!$isAuthorVerified) {
                    $typenames = findAllNodes($n, ['__typename'], 15);
                    foreach ($typenames as $tn) {
                        if (is_string($tn) && strpos($tn, 'VerifiedBadge') !== false) {
                            $isAuthorVerified = true;
                            break;
                        }
                    }
                }

                // Update user global list if we found a verified status here
                if ($isAuthorVerified && !empty($author['id'])) {
                    $auid = $author['id'];
                    if (isset($users[$auid])) {
                        $users[$auid]['is_verified'] = 'Yes';
                    }
                }

                if (!isset($posts[$id])) {
                    $posts[$id] = [
                        'post_id' => $id,
                        'post_url' => $n['url'] ?? "https://facebook.com/$id",
                        'author_name' => $author['name'] ?? "Unknown",
                        'author_id' => (isset($author['id']) && is_numeric($author['id'])) ? $author['id'] : "",
                        'text_content' => str_replace(["\r", "\n"], " ", $textBody),
                        'likes' => $metrics['likes'],
                        'love' => $metrics['love'],
                        'haha' => $metrics['haha'],
                        'wow' => $metrics['wow'],
                        'sad' => $metrics['sad'],
                        'angry' => $metrics['angry'],
                        'care' => $metrics['care'],
                        'comments' => $metrics['comments'],
                        'shares' => $metrics['shares'],
                        'media_urls' => $mediaUrls,
                        'publish_time' => $timestamp_post ? date('Y-m-d H:i:s', $timestamp_post) : ''
                    ];
                }
                else {
                    // Merge/Update existing post with better data
                    if (empty($posts[$id]['text_content']) && !empty($textBody)) {
                        $posts[$id]['text_content'] = str_replace(["\r", "\n"], " ", $textBody);
                    }
                    if (empty($posts[$id]['author_id']) && !empty($author['id'])) {
                        $posts[$id]['author_id'] = $author['id'];
                        $posts[$id]['author_name'] = $author['name'] ?? "Unknown";
                    }
                    if (empty($posts[$id]['media_urls']) && !empty($mediaUrls)) {
                        $posts[$id]['media_urls'] = $mediaUrls;
                    }
                    if (empty($posts[$id]['publish_time']) && $timestamp_post) {
                        $posts[$id]['publish_time'] = date('Y-m-d H:i:s', $timestamp_post);
                    }

                    // Update metrics to max found
                    foreach ($metrics as $mKey => $mVal) {
                        if (isset($posts[$id][$mKey]) && $mVal > $posts[$id][$mKey]) {
                            $posts[$id][$mKey] = $mVal;
                        }
                    }
                }
            }
        }
    }

    $postsFile = "{$harName}_fbposts_{$timestamp}.csv";
    $usersFile = "{$harName}_fbusers_{$timestamp}.csv";

    $fp = fopen($uploadDir . $postsFile, 'w');
    fputcsv($fp, ['post_id', 'post_url', 'author_name', 'author_id', 'text_content', 'likes', 'love', 'haha', 'wow', 'sad', 'angry', 'care', 'comments', 'shares', 'media_urls', 'publish_time'], ",", "\"", "\\");
    foreach ($posts as $post)
        fputcsv($fp, $post, ",", "\"", "\\");
    fclose($fp);

    $fu = fopen($uploadDir . $usersFile, 'w');
    fputcsv($fu, ['user_id', 'user_name', 'profile_url', 'is_verified', 'profile_pic'], ",", "\"", "\\");
    foreach ($users as $user)
        fputcsv($fu, $user, ",", "\"", "\\");
    fclose($fu);

    return ["status" => "success", "files" => [$postsFile, $usersFile]];
}