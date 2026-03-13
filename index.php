<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('memory_limit', '1024M'); // Crucial for large HAR files
set_time_limit(300); // 5 minutes

require_once 'fbscraper.php';

define("UPLOAD_FOLDER", "UPLOAD_FOLDER/");
define("UPLOAD_DIR", __DIR__ . "/" . UPLOAD_FOLDER);

if (!is_dir(UPLOAD_DIR)) {
    mkdir(UPLOAD_DIR, 0775, true);
}

$message = "";
$processed = false;
$postsFile = "";
$usersFile = "";

// Check for POST max size violation
if ($_SERVER['REQUEST_METHOD'] == 'POST' && empty($_POST) && empty($_FILES) && $_SERVER['CONTENT_LENGTH'] > 0) {
    $displayMaxSize = ini_get('post_max_size');
    $message = "File too large! The uploaded file exceeds the post_max_size directive in php.ini (" . $displayMaxSize . ").<br>Please restart the server with increased limits: <code>php -S localhost:8000 -d upload_max_filesize=500M -d post_max_size=500M</code>";
}
elseif ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_FILES["fileToUpload"])) {
    if ($_FILES["fileToUpload"]["error"] !== UPLOAD_ERR_OK) {
        $errorCode = $_FILES["fileToUpload"]["error"];
        $uploadErrorMessages = [
            UPLOAD_ERR_INI_SIZE => 'The uploaded file exceeds the upload_max_filesize directive in php.ini (' . ini_get('upload_max_filesize') . ').',
            UPLOAD_ERR_FORM_SIZE => 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form.',
            UPLOAD_ERR_PARTIAL => 'The uploaded file was only partially uploaded.',
            UPLOAD_ERR_NO_FILE => 'No file was uploaded.',
            UPLOAD_ERR_NO_TMP_DIR => 'Missing a temporary folder.',
            UPLOAD_ERR_CANT_WRITE => 'Failed to write file to disk.',
            UPLOAD_ERR_EXTENSION => 'A PHP extension stopped the file upload.',
        ];
        $message = $uploadErrorMessages[$errorCode] ?? "Unknown upload error (Code: $errorCode).";
    }
    else {
        $targetFile = UPLOAD_DIR . basename($_FILES["fileToUpload"]["name"]);

        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
            $result = processHarFile($targetFile, UPLOAD_DIR);

            if ($result['status'] === "success") {
                $processed = true;
                $postsFile = $result['files'][0];
                $usersFile = $result['files'][1];
            }
            else {
                $message = $result['message'];
            }
        }
        else {
            $message = "Move uploaded file failed (permissions issue?).";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>FBScraper - Pure PHP</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            padding: 50px;
        }

        .container {
            max-width: 600px;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .info-text {
            font-size: 0.85rem;
            color: #6c757d;
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-0">
            <h2 class="text-primary m-0">FBScraper</h2>
            <a href="https://github.com/wsaqaf/fbscraper" target="_blank" class="btn btn-outline-dark btn-sm">GitHub</a>
        </div>
        <hr>
        <?php if ($message): ?>
        <div class="alert alert-danger">
            <?php echo $message; ?>
        </div>
        <?php
endif; ?>

        <?php if ($processed): ?>
        <div class="alert alert-success">Processing Complete!</div>
        <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <span><strong>Posts CSV</strong></span>
                <div>
                    <a href="view_fbposts.php?url=<?php echo urlencode($postsFile); ?>" class="btn btn-sm btn-info mr-2"
                        target="_blank">View Table</a>
                    <a href="<?php echo UPLOAD_FOLDER . $postsFile; ?>" class="btn btn-sm btn-primary"
                        download>Download</a>
                </div>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center mt-2">
                <span><strong>Users CSV</strong></span>
                <div>
                    <a href="view_fbposts.php?url=<?php echo urlencode($usersFile); ?>" class="btn btn-sm btn-info mr-2"
                        target="_blank">View Table</a>
                    <a href="<?php echo UPLOAD_FOLDER . $usersFile; ?>" class="btn btn-sm btn-primary"
                        download>Download</a>
                </div>
            </li>
        </ul>
        <a href="index.php" class="btn btn-link mt-3">Upload another</a>
        <?php
else: ?>
        <form action="index.php" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>Select HAR File</label>
                <input type="file" name="fileToUpload" class="form-control-file" required>
                <div class="info-text">
                    Max upload size: <strong>
                        <?php echo ini_get('upload_max_filesize'); ?>
                    </strong><br>
                    Max post size: <strong>
                        <?php echo ini_get('post_max_size'); ?>
                    </strong>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Process HAR</button>
        </form>
        <?php
endif; ?>
    </div>
</body>

</html>