<?php
/**
 * view_fbposts.php - Optimized for Pure PHP Scraper
 * Features: DataTables, Bootstrap 5, and Smart Media Detection
 */

$file = $_GET['url'] ?? ($_GET['file'] ?? ''); // Supports both parameter names for compatibility
$filePath = __DIR__ . "/UPLOAD_FOLDER/" . basename($file);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Data Viewer - FBScraper</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container-fluid {
            padding: 30px;
        }

        .table-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            overflow-x: auto;
        }

        td {
            font-size: 0.85rem;
            max-width: 400px;
            vertical-align: middle;
        }

        /* Media Thumbnails (Images) */
        .media-thumb {
            height: 50px;
            width: auto;
            border-radius: 4px;
            margin-right: 5px;
            cursor: pointer;
            border: 1px solid #ddd;
            object-fit: cover;
        }

        .media-thumb:hover {
            height: 250px;
            /* Larger preview */
            position: absolute;
            z-index: 9999;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
            transition: height 0.2s;
            border: 2px solid #fff;
        }

        /* Video Clips (Links) */
        .video-link {
            display: inline-block;
            padding: 2px 8px;
            margin-right: 5px;
            margin-bottom: 2px;
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

        .text-truncate-custom {
            max-width: 300px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* Metrics styling */
        .metric-cell {
            font-family: monospace;
            text-align: right;
        }

        /* Custom Sorting Icons to ensure visibility */
        table.dataTable thead .sorting,
        table.dataTable thead .sorting_asc,
        table.dataTable thead .sorting_desc {
            cursor: pointer;
            position: relative;
            padding-right: 30px !important;
        }

        table.dataTable thead .sorting:after,
        table.dataTable thead .sorting_asc:after,
        table.dataTable thead .sorting_desc:after {
            position: absolute;
            right: 8px;
            display: block;
            opacity: 0.5;
            font-size: 0.8rem;
        }

        table.dataTable thead .sorting:after {
            content: "↕";
        }

        table.dataTable thead .sorting_asc:after {
            content: "↑";
            opacity: 1;
            color: #0d6efd;
        }

        table.dataTable thead .sorting_desc:after {
            content: "↓";
            opacity: 1;
            color: #0d6efd;
        }

        .footer {
            text-align: center;
            padding: 20px;
            color: #666;
            font-size: 0.9rem;
            margin-top: 20px;
        }

        .floating-nav {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
        }
    </style>
</head>

<body>

    <div class="container-fluid">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="m-0">Parsed Data: <small class="text-muted"><?php echo htmlspecialchars($file); ?></small></h2>
            <div>
                <a href="https://github.com/wsaqaf/fbscraper" target="_blank" class="btn btn-outline-dark me-2">GitHub</a>
                <a href="index.php" class="btn btn-outline-secondary">← Upload New File</a>
            </div>
        </div>

        <div class="table-container">
            <?php
if ($file && file_exists($filePath)) {
    $handle = fopen($filePath, "r");
    $headers = fgetcsv($handle, 0, ",", "\"", "\\"); // Read headers

    echo "<table id='fbTable' class='table table-hover table-striped'>";
    echo "<thead class='table-light'><tr>";
    foreach ($headers as $h) {
        $displayName = htmlspecialchars(str_replace('_', ' ', $h));
        echo "<th>$displayName</th>";
    }
    echo "</tr></thead><tbody>";

    while (($row = fgetcsv($handle, 0, ",", "\"", "\\")) !== FALSE) {
        echo "<tr>";
        foreach ($row as $index => $cell) {
            $colName = $headers[$index];

            // Handle Long Text Content
            if ($colName == 'text_content') {
                echo "<td><div class='text-truncate-custom' title='" . htmlspecialchars($cell) . "'>" . htmlspecialchars($cell) . "</div></td>";
            }
            // Handle Metrics
            elseif (in_array($colName, ['likes', 'love', 'haha', 'wow', 'sad', 'angry', 'care', 'comments', 'shares'])) {
                echo "<td class='metric-cell'>" . number_format((float)$cell) . "</td>";
            }
            // Handle Media URLs
            elseif ($colName == 'media_urls') {
                if (!empty($cell)) {
                    $urls = explode('; ', $cell);
                    echo "<td>";
                    $clipCount = 1;
                    foreach ($urls as $url) {
                        $url = trim($url);
                        if (empty($url))
                            continue;

                        if (strpos($url, '.mp4') !== false) {
                            echo "<a href='" . htmlspecialchars($url) . "' target='_blank' class='video-link'>🎬 Clip $clipCount</a>";
                            $clipCount++;
                        }
                        else {
                            echo "<a href='" . htmlspecialchars($url) . "' target='_blank'><img src='" . htmlspecialchars($url) . "' class='media-thumb' onerror=\"this.style.display='none'\"></a>";
                        }
                    }
                    echo "</td>";
                }
                else {
                    echo "<td>-</td>";
                }
            }
            // Handle Profile Picture
            elseif (strpos($colName, 'profile_pic') !== false && !empty($cell)) {
                echo "<td><img src='" . htmlspecialchars($cell) . "' style='width:40px;height:40px;border-radius:50%;object-fit:cover;'></td>";
            }
            // Handle Links
            elseif (filter_var($cell, FILTER_VALIDATE_URL)) {
                echo "<td><a href='" . htmlspecialchars($cell) . "' target='_blank' class='btn btn-sm btn-link'>Open Link</a></td>";
            }
            // Standard Cells
            else {
                echo "<td>" . htmlspecialchars($cell) . "</td>";
            }
        }
        echo "</tr>";
    }
    echo "</tbody></table>";
    fclose($handle);
}
else {
    echo "<div class='alert alert-danger'>File not found or invalid selection.</div>";
}
?>
        </div>
    </div>

    <div class="footer">
        <p>FBScraper - <a href="https://github.com/wsaqaf/fbscraper" target="_blank">View on GitHub</a></p>
    </div>

    <div class="floating-nav">
        <a href="index.php" class="btn btn-primary shadow rounded-circle p-3" title="Back to Home">
            🏠
        </a>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#fbTable').DataTable({
                "pageLength": 25,
                "order": [], // Default no initial sort
                "language": {
                    "search": "Filter records:"
                }
            });
        });
    </script>
</body>

</html>