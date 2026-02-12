<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FBScraper - Data Viewer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <style>
        .container-fluid { padding: 20px; }
        
        /* Table Layout */
        td { font-size: 0.85rem; max-width: 300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; vertical-align: middle; }
        td:hover { white-space: normal; overflow: visible; z-index: 10; position: relative; background: #fff; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        
        /* Media Thumbnails (Images) */
        .media-thumb { height: 50px; width: auto; border-radius: 4px; margin-right: 5px; cursor: pointer; border: 1px solid #ddd; object-fit: cover; }
        .media-thumb:hover { height: 150px; position: absolute; z-index: 100; box-shadow: 0 5px 15px rgba(0,0,0,0.3); }
        
        /* Video Clips (Links) */
        .video-link { 
            display: inline-block; 
            padding: 2px 8px; 
            margin-right: 5px; 
            background-color: #e7f3ff; 
            color: #1877f2; 
            border: 1px solid #1877f2; 
            border-radius: 12px; 
            font-size: 0.75rem; 
            font-weight: 600; 
            text-decoration: none; 
            transition: all 0.2s;
        }
        .video-link:hover { 
            background-color: #1877f2; 
            color: #fff; 
            text-decoration: none;
        }
        
        /* Avatar */
        .avatar-img { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; border: 1px solid #dee2e6; }
    </style>
</head>
<body>
<div class="container-fluid">
    <?php
    $file = $_GET['url'] ?? '';
    $filePath = __DIR__ . "/UPLOAD_FOLDER/" . basename($file);

    if ($file && file_exists($filePath)) {
        echo '<div class="d-flex justify-content-between align-items-center mb-3">';
        echo "<h3>Viewing: " . htmlspecialchars($file) . "</h3>";
        echo '<a href="index.php" class="btn btn-secondary btn-sm">← Back to Upload</a>';
        echo '</div>';
        
        // --- 1. Pre-process to identify valid (non-empty) columns ---
        $csvData = [];
        $header = [];
        if (($handle = fopen($filePath, "r")) !== FALSE) {
            $header = fgetcsv($handle);
            while (($row = fgetcsv($handle)) !== FALSE) {
                $csvData[] = $row;
            }
            fclose($handle);
        }

        $validIndices = [];
        if (!empty($header)) {
            $colCount = count($header);
            for ($i = 0; $i < $colCount; $i++) {
                $isEmpty = true;
                foreach ($csvData as $row) {
                    if (isset($row[$i]) && trim($row[$i]) !== '') {
                        $isEmpty = false;
                        break;
                    }
                }
                if (!$isEmpty) {
                    $validIndices[] = $i;
                }
            }
        }

        // --- 2. Render Table with only valid columns ---
        echo '<div class="table-responsive"><table id="fbTable" class="table table-striped table-bordered">';
        
        // Render Header
        echo "<thead class='table-light'><tr>";
        foreach ($validIndices as $i) {
            echo "<th>" . htmlspecialchars($header[$i]) . "</th>";
        }
        echo "</tr></thead><tbody>";
        
        // Render Body
        foreach ($csvData as $row) {
            echo "<tr>";
            foreach ($validIndices as $i) {
                $cell = $row[$i] ?? '';
                $colName = strtolower($header[$i]);
                
                // --- RENDER LOGIC ---
                // 1. Profile Picture
                if (strpos($colName, 'profile_pic') !== false && !empty($cell)) {
                    echo "<td><img src='" . htmlspecialchars($cell) . "' class='avatar-img'></td>";
                } 
                // 2. Media Gallery (Mixed Images & Videos)
                elseif (strpos($colName, 'media_urls') !== false && !empty($cell)) {
                    $urls = explode(";", $cell);
                    echo "<td>";
                    $clipCount = 1;
                    foreach ($urls as $url) {
                        $url = trim($url);
                        if (empty($url)) continue;
                        
                        // Video Link
                        if (strpos($url, '.mp4') !== false) {
                            echo "<a href='" . htmlspecialchars($url) . "' target='_blank' class='video-link'>🎬 Clip $clipCount</a>";
                            $clipCount++;
                        } 
                        // Image Thumbnail
                        else {
                            echo "<a href='$url' target='_blank'><img src='$url' class='media-thumb' onerror=\"this.style.display='none'\"></a>";
                        }
                    }
                    echo "</td>";
                } 
                // 3. Hyperlinks
                elseif ((strpos($colName, 'url') !== false || strpos($colName, 'link') !== false) && filter_var($cell, FILTER_VALIDATE_URL)) {
                    echo "<td><a href='" . htmlspecialchars($cell) . "' target='_blank'>Link</a></td>";
                } 
                // 4. Standard Text
                else {
                    echo "<td>" . htmlspecialchars($cell) . "</td>";
                }
            }
            echo "</tr>";
        }
        echo "</tbody></table></div>";
    } else {
        echo '<div class="alert alert-warning">No valid data file selected.</div>';
        echo '<a href="index.php" class="btn btn-secondary">Back to Upload</a>';
    }
    ?>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#fbTable').DataTable({
            "pageLength": 25,
            "order": [],
            "scrollX": true
        });
    });
</script>
</body>
</html>