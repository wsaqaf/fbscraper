# FBScraper 

A simple script that allows extracting, viewing and converting posts on Facebook pages and groups to CSV for further analysis. Requires no API access.

## Description

It is currently very difficult to extract data from Facebook pages and groups since API access is limited and prevents access to key information such as authors' names, reactions, etc. The data does exist there on the various pages but it is quite time consuming to extract the data manually. So this script does the job for you. All you need to do is login your account, save the data you see on the screen using Inspect (details below) and let the script do the rest.

## Getting Started

### Dependencies

You need python 2+ and a number of libraries, including but may not be limited to (may be updated) the below:

* csv
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
python fbscraper.py X > X-out.html
```
where X is the name of the facebook page. 

If successful, you will soon find two files: X.csv and X-out.html. The latter is used for you to preview the results and the core data is found in the CSV file X.csv.
 
## Author 

The principal author is Walid Al-Saqaf, a developer and senior lecturer at Södertörn University in Stockholm

Reach out to the developer by emailing to walid.al-saqaf@sh.se

## Version History

* 0.1
    * Initial Release

## License

This project is licensed under GNU General Public License (GPL)
