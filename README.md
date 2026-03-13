# FB Scraper

A lightweight PHP-based engine for extracting Facebook post and user data from HAR (HTTP Archive) files. It aggressively parses JSON structures from Facebook's network traffic to build comprehensive datasets without requiring the official Facebook API.

## Data Extracted
The engine is capable of extracting a wide range of parameters from Facebook feed traffic:

- **Post Metrics:** Likes, Love, Haha, Wow, Sad, Angry, and Care reactions.
- **Engagement:** Comment counts and share counts.
- **Content:** Full post text (cleaning newlines), post URLs, and timestamps.
- **Media:** Direct CDN URLs for images and videos attached to posts.
- **User Data:** User IDs, names, profile URLs, and profile picture URLs.
- **Verification:** Accurately identifies verified profiles and pages.

## Getting Started

### Option 1: Native PHP Server
Requires a local web server (like Apache/XAMPP or MAMP) running PHP.

1. Ensure the `fbscraper` directory is placed inside your server's root folder (e.g., `htdocs` or `/var/www/html`).
2. Navigate to `http://localhost/fbscraper/index.php`.
3. Drop a `.har` file exported from Google Chrome (from a Facebook feed or profile) into the UI.
4. The PHP script (`fbscraper.php`) will process the file and generate `.csv` files into the `UPLOAD_FOLDER/` directory.

### Option 2: Docker (Recommended)
This is the easiest way to run the tool without configuring a local PHP environment. It handles large file uploads and comes pre-configured with optimized PHP settings.

#### Setup Guide
1. Ensure you have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running.
2. In your terminal, navigate to the `fbscraper` directory and run:
   ```bash
   docker-compose up -d
   ```
3. Navigate to `http://localhost:8081` in your browser.

**Why use Docker?**
- **Zero Configuration:** No need to install PHP or Apache manually.
- **Large File Support:** Pre-configures PHP to handle uploads up to 500MB and increased memory limits.
- **Isolated Environment:** Keeps your main system clean and avoids version conflicts.

## Project Structure
- `fbscraper.php` - The core parsing logical engine.
- `index.php` - A simple Bootstrap frontend for uploading HAR files.
- `view_fbposts.php` - A browser-based tool to scan and review the generated CSV data.
- `UPLOAD_FOLDER/` - Where the generated CSV datasets are stored.

## License
MIT License. 

## Author
**Dr. Walid Al-Saqaf**  
Email: walid[@]al-saqaf.se
