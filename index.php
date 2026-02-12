<?php
/**
 * index.php for FBScraper
 * Features: File Upload, Python Execution, View & Download Options, Source Code Link
 */

// Define paths
define("UPLOAD_FOLDER", "UPLOAD_FOLDER/"); // Relative path for web links
define("UPLOAD_DIR", __DIR__ . "/" . UPLOAD_FOLDER); // Absolute path for file operations
define("PYTHON_SCRIPT", __DIR__ . "/fbscraper.py");

// Ensure upload directory exists
if (!is_dir(UPLOAD_DIR)) {
    mkdir(UPLOAD_DIR, 0777, true);
}

$message = "";
$processed = false;
$postsFile = "";
$usersFile = "";

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_FILES["fileToUpload"])) {
    // Sanitize filename
    $originalName = pathinfo($_FILES["fileToUpload"]["name"], PATHINFO_FILENAME);
    $sanitizedName = preg_replace("/[^a-zA-Z0-9\._-]/", "_", $originalName);
    
    $uploadedFileName = $sanitizedName . ".har";
    $targetFile = UPLOAD_DIR . $uploadedFileName;

    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
        $output = [];
        $return_var = 0;
        
        // Execute Python script
        // 2>&1 ensures stderr is captured in output for debugging
        $command = "/usr/local/bin/python3 " . escapeshellarg(PYTHON_SCRIPT) . " " . escapeshellarg($targetFile) . " 2>&1";
        exec($command, $output, $return_var);

        if ($return_var === 0) {
            // Parse JSON output from Python
            $jsonStr = implode("", $output);
            $result = json_decode($jsonStr, true);

            if (isset($result['files'])) {
                $processed = true;
                // Identify files based on naming convention
                foreach ($result['files'] as $file) {
                    if (strpos($file, '_fbposts_') !== false) $postsFile = $file;
                    if (strpos($file, '_fbusers_') !== false) $usersFile = $file;
                }
            } else {
                $message = "Processing failed (Invalid JSON): <br>" . htmlspecialchars($jsonStr);
            }
        } else {
            $message = "Error executing script (Code $return_var): <br>" . implode("<br>", $output);
        }
    } else {
        $message = "Failed to upload file.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FBScraper - Facebook HAR Parser</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f0f2f5; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        .upload-container { max-width: 700px; margin: 60px auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, .1); }
        .header { text-align: center; margin-bottom: 30px; color: #1877f2; font-weight: bold; }
        .btn-facebook { background-color: #1877f2; color: white; }
        .btn-facebook:hover { background-color: #166fe5; color: white; }
        .list-group-item { border-left: 5px solid #1877f2; }
        
        /* Top Right Source Code Link */
        .source-link {
            position: absolute;
            top: 20px;
            right: 20px;
            font-weight: 600;
            color: #1877f2;
            text-decoration: none;
            background: white;
            padding: 5px 15px;
            border-radius: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            transition: all 0.2s;
        }
        .source-link:hover {
            color: #0d5cb5;
            text-decoration: none;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
            transform: translateY(-1px);
        }
    </style>
</head>
<body>

    <a href="https://github.com/wsaqaf/fbscraper" target="_blank" class="source-link">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github mr-1" viewBox="0 0 16 16" style="vertical-align: -3px;">
            <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
        </svg>
        Source Code
    </a>

<div class="container">
    <div class="upload-container">
        <h2 class="header">FBScraper</h2>
        
        <?php if ($message): ?>
            <div class="alert alert-danger"><?php echo $message; ?></div>
        <?php endif; ?>

        <?php if ($processed): ?>
            <div class="alert alert-success text-center">
                <strong>Success!</strong> Your HAR file has been processed.
            </div>
            
            <div class="list-group mb-4">
                <div class="list-group-item d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-0">Facebook Posts</h6>
                        <small class="text-muted"><?php echo $postsFile; ?></small>
                    </div>
                    <div class="btn-group" role="group">
                        <a href="<?php echo UPLOAD_FOLDER . $postsFile; ?>" class="btn btn-outline-primary btn-sm" download>Download CSV</a>
                        <a href="view_fbposts.php?url=<?php echo urlencode($postsFile); ?>" class="btn btn-primary btn-sm">View Table</a>
                    </div>
                </div>

                <div class="list-group-item d-flex justify-content-between align-items-center mt-2">
                    <div>
                        <h6 class="mb-0">Facebook Users</h6>
                        <small class="text-muted"><?php echo $usersFile; ?></small>
                    </div>
                    <div class="btn-group" role="group">
                        <a href="<?php echo UPLOAD_FOLDER . $usersFile; ?>" class="btn btn-outline-primary btn-sm" download>Download CSV</a>
                        <a href="view_fbposts.php?url=<?php echo urlencode($usersFile); ?>" class="btn btn-primary btn-sm">View Table</a>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <a href="index.php" class="btn btn-link">← Upload another HAR file</a>
            </div>

        <?php else: ?>
            <div class="text-center mb-4">
                <p class="text-muted">Upload a <code>.har</code> file exported from Facebook to extract posts and users.</p>
            </div>
            <form action="index.php" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="fileToUpload" class="custom-file-input" id="customFile" required accept=".har">
                        <label class="custom-file-label" for="customFile">Choose file...</label>
                    </div>
                </div>
                <button type="submit" class="btn btn-facebook btn-block btn-lg">Upload & Process</button>
            </form>
            
            <script>
                // Add filename to custom file input label
                document.querySelector('.custom-file-input').addEventListener('change', function(e) {
                    var fileName = document.getElementById("customFile").files[0].name;
                    var nextSibling = e.target.nextElementSibling;
                    nextSibling.innerText = fileName;
                });
            </script>
        <?php endif; ?>
    </div>
</div>
</body>
</html>