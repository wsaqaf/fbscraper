# FBScraper

FBScraper is a specialized forensic tool designed to process HTTP Archive (HAR) files from Facebook. It parses complex, nested GraphQL responses to extract rich post metadata, user profiles, and media assets, converting raw network traffic into structured, research-ready CSV datasets.

## ✨ Key Features

* **Deep Metric Extraction**: Goes beyond simple likes to capture the full breakdown of reactions (**Like, Love, Haha, Wow, Sad, Angry**), along with comment counts, shares, and video view counts.
* **Media Recovery**: Automatically extracts full-resolution image URLs and direct video links (MP4), separating them from thumbnails and previews.
* **Smart Video Processing**: Detects video posts and Reels, extracting playback durations, progressive video sources, and high-quality thumbnails.
* **Link Intelligence**: Parses "Link Cards" to retrieve external URLs, domains, titles, and descriptions shared within posts.
* **Integrated Viewer**: Includes a built-in web interface (`view_fbposts.php`) that renders inline video players and image thumbnails for immediate analysis.
* **Fully Containerized**: Optimized for Docker with auto-configured Apache and PHP settings to handle large HAR files seamlessly.

---

## 🚀 Getting Started

### **Option 1: Deploy with Docker (Recommended)**
The fastest way to get FBScraper running without dependency conflicts.

1.  **Clone the Repository:**
    ```sh
    git clone [https://github.com/wsaqaf/fbscraper.git](https://github.com/wsaqaf/fbscraper.git)
    cd fbscraper
    ```

2.  **Launch the Container:**
    ```sh
    docker-compose up -d --build
    ```

3.  **Access FBScraper:**
    Open your browser and visit `http://localhost:8081`.

---

## 🛠 Usage & Data Fetching

### **1. Collecting HAR Data from Facebook**

To capture the necessary network traffic:

1.  Log in to **Facebook** and navigate to the page, group, or search result you wish to scrape.
2.  Open **Developer Tools** (F12) > **Network** tab.
3.  **Important:** Ensure the "Preserve log" checkbox is ticked.
4.  Paste the included `scrolldown-automatically.js` script into the **Console** tab and hit Enter. This will scroll the page to load historical posts dynamically.
5.  Once sufficient data has loaded, right-click any network request in the Network tab and select **"Save all as HAR with content"**.

### **2. Processing the File**

1.  Upload your `.har` file via the **FBScraper** web interface.
2.  The system will process the file using the hybrid Python/PHP engine.
3.  Two CSV files will be generated and available for download:
    * `{OriginalName}_fbposts_{Timestamp}.csv`: Contains posts, text, metrics, and media links.
    * `{OriginalName}_fbusers_{Timestamp}.csv`: Contains profiles found in the feed/search.

---

## 📁 File Structure

* `fbscraper.py`: The core Python extraction engine using recursive JSON traversal.
* `index.php`: The landing page handling file uploads and CLI execution.
* `view_fbposts.php`: Dynamic data viewer with DataTable support and media rendering.
* `scrolldown-automatically.js`: Helper script to automate page scrolling for data collection.
* `UPLOAD_FOLDER/`: Directory where your HAR files and generated CSVs are stored.
* `docker-compose.yml` & `Dockerfile`: Infrastructure as Code configuration.

---

## 📄 License

This project is licensed under the MIT License.

## 🤝 Contributors

* **Walid Saqaf** ([walid@al-saqaf.se](mailto:walid@al-saqaf.se))

For feature requests or issues, please open an issue on the GitHub repository.
