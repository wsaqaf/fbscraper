# FBScraper 

A simple script that allows extracting, viewing and converting posts on Facebook pages and groups to CSV for further analysis. Requires no API access.

## Description

It is currently very difficult to extract data from Facebook pages and groups since API access is limited and prevents access to key information such as authors' names, reactions, etc. The data does exist there on the various pages but it is quite time consuming to extract the data manually. So this script does the job for you. All you need to do is login your account, save the data you see on the screen using Inspect (details below) and let the script do the rest.

[Optional] In addition to the script, there is another Apple Script script that can automate the process of extracting the raw html data from facebook pages and groups. Note that this would only work on a Mac OS computer.

## Getting Started

### Dependencies

You need python 2+ and a number of libraries, including but may not be limited to (may be updated) the below:

* unicodecsv 
* pandas
* BeautifulSoup
* cgi
* cgitb
* urllib
  
You have the option of having this as a web service or run it via the command line

### Installing

Simply store the file in its own folder and ensure that all the libraries are there (use pip install X, where X is the missing python package)

### Executing program

- First you need to go to your Facebook page or group you wish to extract data from
- Then you need to open the page and scroll down to load all the data you need to get (ajax dynamic loading makes it necessary to scroll)
- Once ready, simply right click and select 'Inspect' and open the Elements tab
- Right click on the <body>..</body> and have it collapsed, then select Copy Outer HTML
- Create a text editor with a file entitled X.html, where X is the name of the group/page
- Paste the data copied in the earlier step into the newly created file.
- Save the file to the same directory where the fbscraper.py is
- Then simply run the command prompt in the terminal window while in the same directory:
```
python fbscraper.py X
```
where X is a reference (eg., the name) of the facebook page or group and must have already had its raw content saved locally to X.html . 

If successful, you will soon find two files: X.csv and X-scraped.html. The latter is used for you to preview the results and the core data is found in the CSV file X.csv.

### Batch processing

You can also run the tool to process a batch of files. You can do this with the same command as above and have the file names of the pages listed as arguments as follows:
```
python fbscraper.py X1 X2 X3 X4
```

The tool would then loop through them to extract data and save it in two files per source: (X1-scraped.html X2-scraped.html ...) for views and X1.csv, X2.csv, ... for the actual CSV data. Both formats are UTF-8 encoded.

## Author 

The principal author is Walid Al-Saqaf, a developer and senior lecturer at Södertörn University in Stockholm

Reach out to the developer by emailing to walid.al-saqaf@sh.se

## Version History

* 0.2
    * Initial Release

## License

This project is licensed under GNU General Public License (GPL)
