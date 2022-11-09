#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import unicodecsv as csv
import os.path
import time
import string
import pandas as pd
from bs4 import BeautifulSoup
import io
import re
import datetime
import cgi
import cgitb
import urllib

# The below value is the interface language of Facebook you are using (not the language of the content itself)

non_english = 'sv'  # Only Swedish 'sv' is supported for now

if non_english == 'sv':
    reactions = [
        'Gilla',
        'Älska',
        'Haha',
        'Arg',
        'Ledsen',
        'Wow',
        ]
    shares_word = 'delningar'
else:
    reactions = [
        'Like',
        'Love',
        'Haha',
        'Angry',
        'Sad',
        'Wow',
        ]
    shares_word = 'Shares'


#####Functions#######

def clean_num(post_reaction):
    if len(post_reaction) < 10 and 'K' in post_reaction:
        post_reaction = post_reaction.replace('K', '')
        post_reaction = post_reaction.replace('.', '')
        post_reaction = post_reaction + '00'

    if len(post_reaction) < 10 and 'M' in post_reaction:
        post_reaction = post_reaction.replace('M', '')
        post_reaction = post_reaction.replace('.', '')
        post_reaction = post_reaction + '00000'

    return post_reaction


####################

cgitb.enable()

arguments = cgi.FieldStorage()

arg = ''

if arguments:
    print ('Content-Type: text/html; charset=utf-8')
    print ('')
    commandline = 0
    args = arguments['source'].value.split()
else:
    commandline = 1
    args = sys.argv[1:]

print ('Sources to scrape:' + str(args) + '\n')

for arg in args:
    if len(arg) > 0:
        if os.path.isfile(arg + '.html'):
            print ('Scraping posts from ' + arg + '...')
            with io.open(arg + '.html', mode='r', encoding='utf-8') as \
                fp:
                soup = BeautifulSoup(fp, 'lxml')
        else:
            print ('The input file ' + arg + '.html could not be found!')
            continue
    else:
        print ('No input file provided!')
        continue

    source_id = arg
    posts = soup.findAll('div',
                         attrs={'class': '_5pcr userContentWrapper'})

    output = \
        '''<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>Extraction results</title></head>
<body><table border=1 style=\'font-size:13px;border-collapse:collapse;table-layout:fixed;width:1300px;word-break:break-all\'><tr><td style=\'width:30px\'><center>#</center></td><td style=\'width:120px;\'>Post id</td><td style=\'width:100px;\'>Time_published</td><td style=\'width:100px;\'>Author name</a></td><td style=\'width:100px;\'>Author ID</td><td style=\'width:300px\'>Post message</td><td style=\'width:45px\'><center>Shared<br> as</center></td><td style=\'width:25px\'><center>#<br>pics</center></td><td style=\'width:100px;\'><center>Pics</center></td><td style=\'width:25px\'><center>#<br>vids</center></td><td style=\'width:100px\'><center>Vids</center></td><td style=\'width:30px\'><center>#<br>links</center></td><td style=\'width:40px\'><center>Links</center></td><td style=\'width:40px\'><center>Reacts</center></td><td style=\'width:40px\'><center>Like</center></td><td style=\'width:40px\'><center>Love</center></td><td style=\'width:40px\'><center>Haha</center></td><td style=\'width:40px\'><center>Angry</center></td><td style=\'width:40px\'><center>Sad</center></td><td style=\'width:40px\'><center>Wow</center></td><td style=\'width:40px\'><center>Shares</center></td><td style=\'width:40px\'><center>Comments</center></td></tr>'''

    with open(arg + '.csv', 'wb') as csvfile:
        fieldnames = [
            'source_id',
            'post_id',
            'post_url',
            'created_time',
            'author_name',
            'author_id',
            'msg',
            'shared_as',
            'pic_count',
            'pics',
            'vid_count',
            'vids',
            'link_count',
            'links',
            'reactions',
            'like',
            'love',
            'haha',
            'angry',
            'sad',
            'wow',
            'shares',
            'comment_count',
            ]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames,
                                delimiter=',', lineterminator='\n')
        writer.writeheader()

    index = 0
    regex1 = re.compile('.*\.php\?id\=.+?\&.*')
    regex2 = re.compile('.*_5pbx.*')
    regex3 = re.compile('.*scaledImageFit.*')
    regex4 = re.compile('async.*')
    img_regex = re.compile('_s0 _4ooo _\d.*?_rw img')

    for post in posts:
        index = index + 1
        try:

    # print "trying "+str(index)

            post_id = post.find('div',
                                attrs={'class': '_5pcp _5lel _2jyu _232_'
                                })['id']
            if ':' in post_id:
                post_id = re.sub(r'feed_subtitle_(\d+).+', r'\1',
                                 post_id)
            else:
                post_id = re.sub(r'.+?\;(\d+)\;.+', r'\1', post_id)

            profile_tmp = post.find('a',
                                    attrs={'data-hovercard': regex1})
            tmp = re.search(r'id\=(.+?)\&',
                            str(profile_tmp['data-hovercard']))
            profile_id = tmp.group(1)
            profile_block = post.find('img', attrs={'class': img_regex})
            profile_img = profile_block['src']
            profile_name = profile_block['aria-label'].encode('utf-8')
            post_with_time = post.find('abbr', {'class': '_5ptz'})
            post_created_time = post_with_time['title']
            try:
                post_created_time = \
                    datetime.datetime.strptime(post_created_time,
                        '%m/%d/%Y %I:%M%p').strftime('%Y-%m-%d %H:%M')
            except:
                try:
                    post_created_time = \
                        datetime.datetime.strptime(post_created_time,
                            '%Y-%m-%d %H:%M').strftime('%Y-%m-%d %H:%M')
                except:

          # print "Error0"

                    pass
            post_url = post_with_time.parent['href']
            if post_url.startswith('/'):
                post_url = 'https://facebook.com' + str(post_url)
            is_shared = 0
            shared_as = ''
            shared_url = ''
            try:
                tmp = \
                    re.search(r' shared a[n]? <a.+?href="(.+?)".*?>(.+?)</a>'
                              , str(post))
                shared_url = tmp.group(1)
                if shared_url.startswith('/'):
                    shared_url = 'https://facebook.com' + shared_url
                shared_as = tmp.group(2)
                if len(shared_as) > 1 and len(shared_url) > 1:
                    is_shared = 1
            except:

       # print "Error1"

                pass
            try:
                post_text = post.find('div',
                        attrs={'class': regex2}).text.encode('utf-8')
            except:

         # print "Error2"

                post_text = ' ' * 5

            post_text = re.sub(' +', ' ', re.sub('See More', '',
                               str(post_text)))
            post_text = re.sub(' +', ' ', re.sub('See Translation$', ''
                               , str(post_text)))

            if is_shared == 1:
                post_text = post_text + " <a href='" + shared_url \
                    + "' target=_blank>" + shared_url + '</a>'
            post_images = ''
            post_videos = ''
            vid_count = 0
            pic_count = 0

            try:
                post_pics = post.find_all('img',
                        attrs={'class': regex3})
                for pic in post_pics:
                    if pic['src'] not in post_images:
                        post_images = post_images + ' ' + pic['src']

                more_pics = post.find_all('img',
                        attrs={'class': '_46-i img'})
                for pic in more_pics:
                    if pic['src'] not in post_images:
                        post_images = post_images + ' ' + pic['src']

                post_images = post_images.strip()
                pic_count = len(post_images.split(' '))
                if len(post_images) < 5:
                    pic_count = 0
            except:

        # print "Error3"

                pass
            try:
                post_vids = post.find_all('img', attrs={'class': '_3chq'
                        })
                for vid in post_vids:
                    if vid['src'] not in post_videos:
                        post_videos = post_videos + ' ' + vid['src']
                post_videos = post_videos.strip()
                vid_count = len(post_videos.split(' '))
                if len(post_videos) < 5:
                    vid_count = 0
            except:

       # print "Error4"

                pass
            post_links = ''
            link_count = 0
            try:
                pst_links = post.find_all('a',
                        attrs={'data-lynx-mode': regex4})
                for l in pst_links:
                    tmp = \
                        re.search(r'facebook\.com\/l\.php\?u\=(http.+?)\&'
                                  , l['href']).group(1)
                    if len(tmp) > 0:
                        l['href'] = urllib.unquote(tmp)
                        if l['href'] not in post_links:
                            post_links = post_links + ' ' + l['href']
                urls = \
                    re.findall('http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!<>*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+'
                               , str(post_text))
                for l in urls:
                    if l not in post_links:
                        post_links = post_links + ' ' + l
                post_links = post_links.strip()

                if shared_url and is_shared:
                    post_links = shared_url
                    link_count = 1

                link_count = len(post_links.split(' '))

                if len(post_links) < 5:
                    link_count = 0
            except:

        # print "Error5"

                pass

            post_shares = 0

            post_likes_details = ''
            post_reaction = 0
            post_reactions = [
                0,
                0,
                0,
                0,
                0,
                0,
                ]

            try:
                post_likes_details = post.find('div',
                        attrs={'class': 'UFILikeSentenceText'
                        }).text.encode('utf-8')
                if ' likes this' in post_likes_details:
                    post_reactions[0] = 1
                elif ',' in post_likes_details:
                    post_reactions[0] = 3
                    tmp = re.search(r'\d+[\.]?[K]?[M]?',
                                    post_likes_details).group()
                    tmp = clean_num(tmp)
                    if int(tmp) > 0:
                        post_reactions[0] = post_reactions[0] + int(tmp)
                elif ' like this' in post_likes_details:
                    post_reactions[0] = 2
            except:
                try:
                    post_likes_details = str(post.find('div',
                            attrs={'class': '_3t53 _4ar- _ipn'}))
                    indx = 0
                    for react in reactions:
                        try:
                            tmp = re.search('"(\\d+[.]?\\d*[K]?[M]?) '
                                    + react + '"',
                                    post_likes_details).group()
                            tmp = re.sub('"(\\d+[.]?\\d*[K]?[M]?) '
                                    + react + '"', r'\1', tmp)
                            tmp = clean_num(tmp)
                            if int(tmp) >= 0:
                                post_reactions[indx] = tmp

                            if len(post_reactions[indx]) > 10:
                                post_reactions[indx] = 0
                            post_reaction = post_reaction \
                                + int(post_reactions[indx])
                        except:

           # print "Error6"

                            pass
                        indx = indx + 1
                except:

          # print "Error7"

                    pass
            try:
                post_shares = post.find('a',
                        attrs={'class': 'UFIShareLink'
                        }).text.encode('utf-8')
                post_shares = int(re.sub(' ' + shares_word + '?', '',
                                  post_shares))
            except:
                try:
                    post_shares = post.find('a',
                            attrs={'class': '_ipm _2x0m'
                            }).text.encode('utf-8')
                    post_shares = int(re.sub(' ' + shares_word + '?', ''
                            , post_shares))
                except:

           # print "Error8"

                    pass
            post_shares = str(post_shares).split(' ', 1)[0]
            try:
                try:
                    post_comments_block = post.find('h6',
                            attrs={'class': 'accessible_elem'},
                            string='Comments').text.encode('utf-8')
                except:

         # print "Error9"

                    pass
                try:
                    post_comments_block = post.find_all('div',
                            attrs={'class': 'UFICommentContentBlock'})
                    comment_count = len(post_comments_block)
                except:

         # print "Error10"

                    pass
                try:
                    post_comments = post.find('a',
                            attrs={'class': 'UFIPagerLink'
                            }).text.encode('utf-8')
                    tmp = re.search(r'\d+[.]?\d*[K]?[M]?',
                                    post_comments).group()
                    tmp = clean_num(tmp)
                    comment_count = comment_count + int(tmp)
                except:

         # print "Error11"

                    pass
                try:
                    post_replies = post.find('div',
                            attrs={'class': 'UFIImageBlockContent _42ef _8u'
                            }).text.encode('utf-8')
                    tmp = re.search(r'\d+[.]?\d*[K]?[M]?',
                                    post_replies).group()
                    tmp = clean_num(tmp)
                    comment_count = comment_count + int(tmp)
                except:

         # print "Error12"

                    pass
            except:

       # print "Error13"

                post_comments_block = 'None'
                pass

            output = output + '\n<tr><td><center>' + str(index) \
                + "</center></td><td><a href='" + post_url \
                + "' target=_blank>" + post_id + '</a></td><td>' \
                + str(post_created_time) + '</td><td>' \
                + str(profile_name) \
                + "</td><td><a href='https://facebook.com/" \
                + str(profile_id) + "' target=_blank>" \
                + str(profile_id) + '</td><td>' + post_text \
                + '</td><td><center>' + str(shared_as) \
                + '</center></td><td><center>' + str(pic_count) \
                + '</center></td>'
            if pic_count > 0:
                pic_elements = ''
                pictures = post_images.split(' ')
                for pic in pictures:
                    pic_elements = pic_elements + ' <br><br> ' \
                        + '<a href="' + pic \
                        + '" target=_blank><img src="' + pic \
                        + '" width=100></a>'
                output = output + '<td>' + str(pic_elements) + '</td>'
            else:
                output = output + '<td></td>'
            output = output + '<td><center>' + str(vid_count) \
                + '</center></td>'
            if vid_count > 0:
                vid_elements = ''
                videos = post_videos.split(' ')
                for vid in videos:
                    vid_elements = vid_elements + ' <br><br> ' \
                        + '<a href="' + post_url \
                        + '" target=_blank><img src="' + vid \
                        + '" width=100></a>'
                output = output + '<td>' + str(vid_elements) + '</td>'
            else:
                output = output + '<td></td>'
            output = output + '<td><center>' + str(link_count) \
                + '</center></td>'

            if link_count > 0:
                link_elements = ''
                links = post_links.split(' ')
                cnt = 1
                for lnk in links:
                    link_elements = link_elements + ' ' + '<a href="' \
                        + lnk + '" target=_blank>' + str(cnt) + '</a>'
                    cnt = cnt + 1
                output = output + '<td><center>' + str(link_elements) \
                    + '</center></td>'
            else:
                output = output + '<td></td>'
            output = output + '<td><center>' + str(post_reaction) \
                + '</center></td>'

            indx = 0
            for react in reactions:
                output = output + '<td><center>' \
                    + str(post_reactions[indx]) + '</center></td>'
                indx = indx + 1

            output = output + '<td><center>' + str(post_shares) \
                + '</center></td><td><center>' + str(comment_count) \
                + '</center></td></center></tr>'

            with open(arg + '.csv', 'ab') as csvfile:
                row = [
                    source_id,
                    post_id,
                    post_url,
                    post_created_time,
                    profile_name,
                    profile_id,
                    post_text,
                    shared_as,
                    pic_count,
                    post_images,
                    vid_count,
                    post_videos,
                    link_count,
                    post_links,
                    post_reaction,
                    post_reactions[0],
                    post_reactions[1],
                    post_reactions[2],
                    post_reactions[3],
                    post_reactions[4],
                    post_reactions[5],
                    post_shares,
                    comment_count,
                    ]
                writer = csv.writer(csvfile)
                writer.writerow(row)
        except:

    # print "Error with post: "+post_id+" "+str(e)

            continue

    output = output + "</table><hr> Download CSV from <a href='" + arg \
        + '.csv' + "'>here</a></body></html>"

    if commandline:
        with io.open(arg + '-scraped.html', 'w', encoding='utf8') as f:
            f.write(unicode(output, 'utf-8'))
        print ('Saved view of scraped data to ' + arg \
            + '''-scraped.html
---
''')
    else:
        print (output)

print ('Done!')
