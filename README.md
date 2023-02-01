# FBScraper 

A simple script that allows extracting, viewing and converting posts on Facebook pages, groups or search quiries to CSV for further analysis. Requires no API access.

## Description

It is currently difficult to extract data from Facebook since API access is limited and prevents access to key information such as authors' names, reactions, etc. The data does exist there on the various pages but it is quite time consuming to extract the data manually. So this script does the job for you. All you need to do is download the www.facebook.com.har file containing the data you need to analyze using Inspect (details below) and let the script do the rest.

[Optional] In addition to the script, there is another Apple Script script that can automate the process of extracting the relevant post entries from facebook and run the python script automatically afterwords. Note that this would only work on a Mac OS computer.

## Dependencies

1) Python 3+
2) [optional] appleScript if you wish to automate the page scrolling and HAR file downloading process
  
You have the option of having this as a web service or run it via the command line

## Installing

- Chrome browser
- Ensure you install python if it is not installed yet. Here is the official link: (https://www.python.org/downloads)[https://www.python.org/downloads/]
- Then download the file *fbscraper.py* and if you wish to try the AppleScript, download the file *extract-posts-mac.scpt* as well. 

## Executing script

- First you need to go to your Facebook page, group or search page you wish to extract data from
- Then you need to open the Developer Tools (View->Developer->Developer Tools)
- In Developer tools, Go to the Network tab and ensure that cache is disabled and that recording is on and has the settings shown below.
![Developer Tools](https://user-images.githubusercontent.com/81685/216130319-be70ba73-3265-4f82-8339-37443521af67.png)

- On the main FB page you have open, first reload the page and it is recommended to do a [hard refresh](https://www.howtogeek.com/672607/how-to-hard-refresh-your-web-browser-to-bypass-your-cache/) if necessary to reload data from the source
- Scroll down to load all the data you need to get (you must keep the Developer Tools window open as you do so)
- Once you have scrolled down to include all the posts you wish to load, go to the Developer Tools window and click on the download button (shown above) to download the HAR file
- Usually, it will allow you to download to the default download folder, but you can easily change it so that it downloads the file to where the fbscraper.py script is
- Open the Terminal window and go to the location where the file fbscraper.py is located
- Then simply run the command prompt in the terminal window while in the same directory:
```
python fbscraper.py
```
If www.facebook.com.har has a different name other than www.facebook.com.har or is not in the same directory, make sure to rename it to www.facebook.com.har and copy it to the same directory where fbscraper.py is or include the full path of the file as an argument to the script file, e.g., *python fbscraper.py /Users/myname/Downloads/new.har* .

If successful, you will soon find a CSV file (X.csv) where X is the name assigned by the script depending on the title of the page you extracted data from. For example, if you opened https://facebook.com/cnn, the file would be cnn.csv

## Automated method with AppleScript (Mac OS only)

Sometimes, it may be that you wish to download thousands of posts and it may be a pain to have to wait until all pages are loaded manually. In this case, you can opt for using the automation script that simulates scrolling for you. You simply need to open the file *extract-posts-mac.scpt" and filling in the required details. 

### Required field
THE only field that has to be filled is URLs since it contains the list of Facebook links you wish to extract posts from. In the script file it is marked with *[REQUIRED]*:

```
#[REQUIRED]#
set URLs to {""}
```

The above field takes the list of the URLs on Facebook https://facebook.com that you are trying to extract posts from. It could including pages, groups, searches, etc. examples: https://www.facebook.com/cnn for the CNN page, https://www.facebook.com/search/top?q=crypto for searching for the keyword 'crypto', https://www.facebook.com/groups/565383300477194 for the group with the ID (565383300477194). If using multiple values, use commas to separate them, e.g., {"https://www.facebook.com/cnn","https://www.facebook.com/search/top?q=crypto","https://www.facebook.com/groups/565383300477194"}

### Additional fields

There are also additional fields that are marked with *[OPTIONAL]* as follows:

*page_flips*: the number of page flips required to scroll down to load all the posts requiring extraction. The default is 10 but it could go up in the hundreds of even thousands provided your browser can handle that. As you load more files, the browser will get slower and even crash. So choose this number wisely. Additionally, the delays in downloading and running the python file may have to be increased if required.

*pythonPath*: the name of the python command (the default 'python' should be fine, but you may change it to something else like 'python3' depending on your system)

*BrowserName*: by default "Google Chrome" but it can have a different name if needed

*DownloadFolder*: by default, the script uses the default Downloads folder for the home user, i.e., /Users/username/Downloads. It can change if required as it depends on the Google Chrome settings

*page_loading_time:* the number of seconds the script waits before scrolling to the next page


## Author 

The principal author is Walid Al-Saqaf, a developer and senior lecturer at Södertörn University in Stockholm

Reach out to the developer by emailing to walid.al-saqaf@sh.se

## Version History

* 2.0
    * Major updated version

## License

This project is licensed under GNU General Public License (GPL)
