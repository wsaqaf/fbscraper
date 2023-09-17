import sys
import os
import json
import csv
import re
from datetime import datetime
from bs4 import BeautifulSoup
import html
import logging

####################### functions ###########################

def get_json_element_by_key(obj, search_key):
    try:
        if isinstance(obj, dict):
            for key, value in obj.items():
                if key == search_key:
                    return value
                else:
                    result = get_json_element_by_key(value, search_key)
                    if result is not False:
                        return result
        elif isinstance(obj, list):
            for item in obj:
                result = get_json_element_by_key(item, search_key)
                if result is not False:
                    return result
        return False
    except:
        return False

def find_value_by_key(json_string, search_key):
    try:
        data = json.loads(json_string)
        return get_json_element_by_key(data, search_key)
    except json.JSONDecodeError:
        return False

def load_post(p,i):
    fbpost={}
    for r in labels_str: fbpost[r]=""
    for r in labels_num: fbpost[r]=0
    fbpost["post_id"]=p['post_id']
#### post time & url ####
    fbpost["post_time"]=datetime.fromtimestamp(p['comet_sections']['context_layout']['story']['comet_sections']['metadata'][0]['story']['creation_time']).isoformat()
    fbpost["post_url"]=p['comet_sections']['context_layout']['story']['comet_sections']['metadata'][0]['story']['url']
#### post text ####
    try:
        fbpost["post_text"]=p['comet_sections']['content']['story']['message']['text'].replace('\n', '')
    except:
        fbpost["post_text"]=""

#### user info ####
    fbpost["user_id"]=p['comet_sections']['context_layout']['story']['comet_sections']['title']['story']['actors'][0]['id']
    fbpost["user_name"]=p['comet_sections']['context_layout']['story']['comet_sections']['title']['story']['actors'][0]['name']
    fbpost["user_webpage"]=p['comet_sections']['context_layout']['story']['comet_sections']['title']['story']['actors'][0]['url']
    fbpost["user_profile"]=p['comet_sections']['context_layout']['story']['comet_sections']['actor_photo']['story']['actors'][0]['profile_url']
    fbpost["user_profile_pic"]=p['comet_sections']['context_layout']['story']['comet_sections']['actor_photo']['story']['actors'][0]['profile_picture']['uri']
    
#### post content ####
    try: fbpost["post_text"]=p['comet_sections']['content']['story']['message']['text'].replace('\n', '')
    except: fbpost["post_text"]=""
    
    for attachment in p['comet_sections']['content']['story']['attachments']:
        attachment_type=attachment['style_list'][0]
#### Web preview (if any) ####
        if (attachment_type=='share'):
            if (attachment['styles']['attachment']['story_attachment_link_renderer']['attachment']['web_link']['__typename']=='ExternalWebLink'):
                fbpost["weblink_url"]=attachment['styles']['attachment']['story_attachment_link_renderer']['attachment']['web_link']['url']
            else:
                try:
                    fbpost["weblink_url"]=attachment['styles']['attachment']['url']
                    fbpost["weblink_title"]=attachment['styles']['attachment']['source']['text']
                except: pass
            try: fbpost["weblink_pic"]=attachment['styles']['attachment']['media']['large_share_image']['uri']
            except: pass
            try: fbpost["weblink_preview"]=attachment['styles']['attachment']['title_with_entities']['text'].replace('\n', '')
            except: pass                
#### Photo (if any) ####
        elif (attachment_type=='photo'):
            fbpost["photo_url"]=attachment['styles']['attachment']['media']['photo_image']['uri']
        elif (attachment_type=='album'):
            for photo in attachment['styles']['attachment']['all_subattachments']['nodes']:
                fbpost["photo_url"]=fbpost["photo_url"]+photo['media']['image']['uri']+"\n"
            fbpost["photo_url"]=fbpost["photo_url"].strip()
#### Video (if any) ####
        elif (attachment_type.startswith('video')):
            fbpost["video_url"]=attachment['styles']['attachment']['media']['url']
            fbpost["video_permalink"]=attachment['styles']['attachment']['media']['permalink_url']
            fbpost["video_duration"]=attachment['styles']['attachment']['media']['playable_duration_in_ms']
            fbpost["video_thumbnail"]=attachment['styles']['attachment']['media']['preferred_thumbnail']['image']['uri']
        break
#### Reactions ####

    try:
        feedback=p['comet_sections']['feedback']['story']['feedback_context']['feedback_target_with_context']['ufi_renderer']['feedback']['comet_ufi_summary_and_actions_renderer']['feedback']
        fbpost["shares"]=feedback['share_count']['count']
        
        try: fbpost["comments"]=feedback['comments_count_summary_renderer']['feedback']['comment_count']['total_count']
        except: fbpost["comments"]=feedback['comments_count_summary_renderer']['feedback']['total_comment_count']

        try: fbpost["video_view_count"]=feedback['video_view_count']
        except: pass
        for reaction in feedback['cannot_see_top_custom_reactions']['top_reactions']['edges']:
            if (reaction['node']['id']=="1635855486666999"): fbpost["like"]=reaction['reaction_count']
            elif (reaction['node']['id']=="1678524932434102"): fbpost["love"]=reaction['reaction_count']
            elif (reaction['node']['id']=="478547315650144"): fbpost["wow"]=reaction['reaction_count']
            elif (reaction['node']['id']=="115940658764963"): fbpost["haha"]=reaction['reaction_count']
            elif (reaction['node']['id']=="908563459236466"): fbpost["sad"]=reaction['reaction_count']
            elif (reaction['node']['id']=="444813342392137"): fbpost["angry"]=reaction['reaction_count']
        fbpost["reactions"]=fbpost["like"]+fbpost["love"]+fbpost["wow"]+fbpost["haha"]+fbpost["sad"]+fbpost["angry"]
    except: pass
#### add post to collection using post_id as key ####
    fbpost_list=[]
    for item in fbposts_list[0]: fbpost_list.append(fbpost[item])
    return fbpost_list

#check if key exists
def key_exists(element, *keys):
    if not isinstance(element, dict):
        raise AttributeError('keys_exists() expects dict as first argument.')
    if len(keys) == 0:
        raise AttributeError('keys_exists() expects at least two arguments, one given.')

    _element = element
    for key in keys:
        try:
            _element = _element[key]
        except KeyError:
            return False
    return True

#for debugging purposes only
def debug_content(content):
    text_file = open("temp.txt", "w")
    text_file.write(content)
    text_file.close()

####################### end functions ###########################

file_name="www.facebook.com.har"
if len(sys.argv)>1:
    if not sys.argv[1].startswith('-'): file_name=sys.argv[1]

if not os.path.isfile(file_name): exit(1)

with open(file_name, 'r', encoding="utf-8") as f:
    contents=f.read()
    dtime=datetime.now().strftime("%Y%m%d%H%M")
    with open(file_name.replace('.har','')+'-'+dtime+'.har', 'w', encoding="utf-8") as f2:
        f2.write(contents)
        print("Copied har file to: "+file_name.replace('.har','')+'-'+dtime+'.har')	

content_j=json.loads(contents)
m=""

try:
    m=re.search('https://www\.facebook\.com/(.+[^/])/?',content_j['log']['pages'][0]['title'])
except:
    try:
        m=re.search('https://www\.facebook\.com/(.+[^/])/?',content_j['log']['entries'][0]['url'])
    except: pass

if m:
    file_name=m.group(1)
    pattern=re.compile('[\W_]+')
    file_name=pattern.sub('_', file_name)
    if len(file_name)>50: file_name=file_name[:50]
    print("Found: "+file_name)
else:
    print ("Failed to find reference")
    exit(1)

content="["
top_posts=[]
for entry in content_j['log']['entries']:
    if entry['request']['url']=='https://www.facebook.com/api/graphql/':
        try:
            content=content+entry['response']['content']['text'].replace('\\"','')+","
        except:
            pass
    elif entry['_resourceType']=="document":
        try:
            if ('text' in entry['response']['content']):
                soup = BeautifulSoup(entry['response']['content']['text'], "html.parser")
                script_tags = soup.find_all('script')#, type='application/json')
                content_list = [tag.text.strip() for tag in script_tags]
                for tag in script_tags:
                    m = re.search("(\{\"define\"\:\[\[.+?)\)\;", str(tag))
                    if m:
                        tag_text = m.group(1)
                        json_el=json.loads(tag_text)
                        try:
                            top_post=get_json_element_by_key(json_el,"timeline_list_feed_units")
                            if (top_post):
                                top_posts.append(top_post['edges'][0])
                        except:
                            try:
                                if (key_exists(item[3][1],'__bbox','result','data','serpResponse','results','edges')):
                                    temp_j=item[3][1]['__bbox']['result']['data']['serpResponse']['results']['edges'][0]
                                    if (key_exists(temp_j,'relay_rendering_strategy','view_model','click_model')):
                                        top_posts.append(item[3][1]['__bbox']['result'])
                            except: pass
        except (AttributeError, KeyError) as ex: logging.exception("error")
if (not file_name):
    print ("Found no page or group. Exiting...")
    exit(0)

content=content.rstrip(",")+"]"
content=re.compile('}\s*{').sub('},{', content)

data = json.loads(content)

if (top_posts): data=top_posts+data
    
labels_str=["post_id","post_time","post_url","user_id","user_name","user_webpage","user_profile","user_profile_pic","post_text","weblink_url","weblink_title","weblink_pic","weblink_preview","photo_url","video_url","video_duration"]
labels_num=["video_view_count","shares","comments","reactions",'like','love','wow','haha','sad','angry']
fbposts_list=[]
fbposts_list.append(labels_str+labels_num)

i=-1
for post in data:
     
    try: post=post['data']
    except: pass
    i=i+1
    try:
        if (post['node']['__typename']=='Story'):
            new_post=load_post(post['node'],i)
            fbposts_list.append(new_post)
        elif (post['node']['__typename']=='User' or post['node']['__typename']=='Page' or post['node']['__typename']=='Group'):
            if (post['node']['__typename']=='User'):
                posts=post['node']['timeline_list_feed_units']['edges']
            elif (post['node']['__typename']=='Page'):
                posts=post['node']['timeline_feed_units']['edges']
            elif (post['node']['__typename']=='Group'):
                posts=post['node']['group_feed']['edges']
            for p in posts:
                new_post=load_post(p['node'],i)
                fbposts_list.append(new_post)
        else:
            new_post=load_post(post['node'],i)
            fbposts_list.append(new_post)
                
    except:
        try:
            posts=post['serpResponse']['results']['edges']
            for p in posts:
                new_post=load_post(p['relay_rendering_strategy']['view_model']['click_model']['story'],i)
                fbposts_list.append(new_post)
            continue
        except:
            pass

if (len(fbposts_list)>1):
    with open(file_name+'-'+dtime+'.csv', 'w', encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerows(fbposts_list)
        print("Exported CSV data to: "+file_name+'-'+dtime+'.csv')
