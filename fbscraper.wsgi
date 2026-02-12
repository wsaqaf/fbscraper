import sys
import logging

# Ensure the library paths and app directory are in the system path
sys.path.insert(0, "/usr/local/lib/python3.11/site-packages")
sys.path.insert(0, '/var/www/html')

from fbscraper import app as application

# Initialize logging for the WSGI process
logging.basicConfig(level=logging.INFO)
logging.info("FBScraper WSGI app loaded - handling /api/process requests")