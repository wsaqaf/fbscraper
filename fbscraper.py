import os
import sys
import json
import pandas as pd
import logging
import re
from datetime import datetime
from flask import Flask, request, jsonify

app = Flask(__name__)

# --- CONFIGURATION ---
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
UPLOAD_PATH = os.path.join(BASE_DIR, "UPLOAD_FOLDER")

if not os.path.exists(UPLOAD_PATH):
    os.makedirs(UPLOAD_PATH)

# --- CSV HEADERS ---
FB_POST_HEADER = [
    'post_id', 'post_url', 'author_name', 'author_id', 
    'publish_time', 'text_content', 
    'like_count', 'love_count', 'haha_count', 'wow_count', 'sad_count', 'angry_count',
    'share_count', 'comment_count', 
    'video_view_count', 'video_duration_sec', 'video_thumbnail_url', 'media_urls'
]

FB_USER_HEADER = [
    'user_id', 'user_name', 'profile_url', 'profile_pic_url', 'is_verified'
]

# --- HELPERS ---

def find_node_by_key(obj, target_key):
    """Recursively searches for a dictionary key."""
    if isinstance(obj, dict):
        if target_key in obj: return obj[target_key]
        for key, value in obj.items():
            result = find_node_by_key(value, target_key)
            if result is not None: return result
    elif isinstance(obj, list):
        for item in obj:
            result = find_node_by_key(item, target_key)
            if result is not None: return result
    return None

def find_profile_pic(story):
    """Aggressively searches for a profile picture URI."""
    # 1. Check Context Layout (Feed)
    context_layout = find_node_by_key(story, 'context_layout')
    if context_layout:
        actor_photo = find_node_by_key(context_layout, 'actor_photo')
        if actor_photo:
            pic = find_node_by_key(actor_photo, 'profile_picture')
            if pic and isinstance(pic, dict) and 'uri' in pic:
                return pic['uri']

    # 2. Check 'actors' list (Search Results)
    actors = find_node_by_key(story, 'actors')
    if isinstance(actors, list):
        for actor in actors:
            if 'profile_picture' in actor:
                return actor['profile_picture'].get('uri')

    # 3. Fallback
    pic_node = find_node_by_key(story, 'profile_picture')
    if pic_node and isinstance(pic_node, dict) and 'uri' in pic_node:
        return pic_node['uri']
    return ""

def extract_text_content(story):
    if 'message' in story and isinstance(story['message'], dict):
        return story['message'].get('text', '')
    msg_node = find_node_by_key(story, 'message')
    if isinstance(msg_node, dict):
        return msg_node.get('text', '')
    return ""

def extract_metrics(story):
    metrics = {
        'like': 0, 'love': 0, 'haha': 0, 'wow': 0, 'sad': 0, 'angry': 0,
        'share': 0, 'comment': 0, 'views': 0
    }
    
    ufi_renderer = find_node_by_key(story, 'comet_ufi_summary_and_actions_renderer')
    if not ufi_renderer:
        feedback_context = find_node_by_key(story, 'feedback_context')
        if feedback_context:
            ufi_renderer = find_node_by_key(feedback_context, 'feedback')

    if ufi_renderer and isinstance(ufi_renderer, dict):
        feedback = ufi_renderer.get('feedback') or ufi_renderer
        
        rc = feedback.get('reaction_count')
        metrics['like'] = rc.get('count', 0) if isinstance(rc, dict) else (rc or 0)
        
        sc = feedback.get('share_count')
        metrics['share'] = sc.get('count', 0) if isinstance(sc, dict) else (sc or 0)
        
        cc = find_node_by_key(feedback, 'total_count')
        metrics['comment'] = cc if cc else 0
        
        vc = feedback.get('video_view_count')
        metrics['views'] = vc if vc else 0

        reaction_map = {
            '1635855486666999': 'like', '1678524932434102': 'love', 
            '115940658764963': 'haha', '478547315650144': 'wow', 
            '908563459236466': 'sad', '444813342392137': 'angry'
        }
        top_reactions = feedback.get('top_reactions', {}).get('edges', [])
        for edge in top_reactions:
            node = edge.get('node', {})
            r_id = node.get('id')
            count = edge.get('reaction_count', 0)
            if r_id in reaction_map:
                metrics[reaction_map[r_id]] = count
    return metrics

def extract_media_deep(story):
    """
    Scans for media URLs and video stats.
    """
    data = {
        'media_urls': set(),
        'video_duration': 0,
        'video_thumbnail': ''
    }
    
    def scan(obj):
        if isinstance(obj, dict):
            # Check for MEDIA objects
            if 'media' in obj and isinstance(obj['media'], dict):
                media = obj['media']
                
                # Images
                if 'image' in media and 'uri' in media['image']:
                    data['media_urls'].add(media['image']['uri'])
                if 'photo_image' in media and 'uri' in media['photo_image']:
                    data['media_urls'].add(media['photo_image']['uri'])
                if 'large_share_image' in media and 'uri' in media['large_share_image']:
                    data['media_urls'].add(media['large_share_image']['uri'])

                # Videos (Progressive is best)
                if 'videoDeliveryResponseFragment' in media:
                    res = media['videoDeliveryResponseFragment'].get('videoDeliveryResponseResult')
                    if res and 'progressive_urls' in res:
                        for prog in res['progressive_urls']:
                            if 'progressive_url' in prog:
                                data['media_urls'].add(prog['progressive_url'])
                
                # Video Fallbacks
                if 'playable_url' in media and media['playable_url']:
                    data['media_urls'].add(media['playable_url'])
                if 'browser_native_hd_url' in media and media['browser_native_hd_url']:
                    data['media_urls'].add(media['browser_native_hd_url'])
                if 'browser_native_sd_url' in media and media['browser_native_sd_url']:
                    data['media_urls'].add(media['browser_native_sd_url'])

                # Thumbnails
                if 'preferred_thumbnail' in media and 'image' in media['preferred_thumbnail']:
                    uri = media['preferred_thumbnail']['image'].get('uri')
                    if uri:
                        data['video_thumbnail'] = uri
                        data['media_urls'].add(uri)

                # Duration
                if 'playable_duration_in_ms' in media:
                    try: data['video_duration'] = media['playable_duration_in_ms'] / 1000
                    except: pass

            # Recurse values
            for k, v in obj.items():
                scan(v)
                
        elif isinstance(obj, list):
            for item in obj:
                scan(item)

    scan(story)
    return data

# --- MAIN LOGIC ---

def extract_fb_data(har_data):
    posts = {}
    users = {}

    entries = har_data.get('log', {}).get('entries', [])
    for entry in entries:
        if "facebook.com/api/graphql/" not in entry['request']['url']:
            continue
            
        resp_text = entry.get('response', {}).get('content', {}).get('text', '')
        if not resp_text: continue

        parts = resp_text.strip().split('\n')
        for part in parts:
            try:
                data = json.loads(part)
                
                # --- A. USER EXTRACTION (Search Results) ---
                if 'serpResponse' in data.get('data', {}):
                     results = data['data']['serpResponse'].get('results', {}).get('edges', [])
                     for res in results:
                         if 'rendering_strategy' in res:
                             strategies = res['rendering_strategy'].get('result_rendering_strategies', [])
                             for strat in strategies:
                                 vm = strat.get('view_model', {})
                                 prof = vm.get('profile', {})
                                 if prof:
                                     u_id = prof.get('id')
                                     if u_id and u_id not in users:
                                         users[u_id] = {
                                             'user_id': u_id,
                                             'user_name': prof.get('name'),
                                             'profile_url': prof.get('url'),
                                             'profile_pic_url': find_profile_pic(prof),
                                             'is_verified': prof.get('is_verified', False)
                                         }

                # --- B. POST EXTRACTION ---
                edges = []
                if 'serpResponse' in data.get('data', {}):
                    edges = data['data']['serpResponse'].get('results', {}).get('edges', [])
                elif 'node' in data.get('data', {}):
                    edges = [{'node': data['data']['node']}]
                elif 'viewer' in data.get('data', {}):
                    edges = data['data']['viewer'].get('news_feed', {}).get('edges', [])
                
                if not edges:
                    found_edges = find_node_by_key(data, 'edges')
                    if isinstance(found_edges, list): edges = found_edges

                if not edges: continue

                for edge in edges:
                    if not isinstance(edge, dict): continue
                    
                    story = find_node_by_key(edge, 'story')
                    if not story or not isinstance(story, dict): continue
                    
                    p_id = story.get('post_id') or story.get('id')
                    if not p_id or len(str(p_id)) < 5: continue 
                    if p_id in posts: continue

                    # 1. Author
                    actor = {}
                    actors_list = story.get('actors') or find_node_by_key(story, 'actors')
                    if actors_list and isinstance(actors_list, list) and len(actors_list) > 0:
                        actor = actors_list[0]
                    
                    u_id = actor.get('id')
                    u_name = actor.get('name')
                    u_url = actor.get('url')
                    u_pic = find_profile_pic(story)
                    
                    # 2. Verification
                    u_verified = False
                    title_ranges = find_node_by_key(story, 'ranges')
                    if title_ranges and isinstance(title_ranges, list):
                        for rng in title_ranges:
                            entity = rng.get('entity', {})
                            if entity.get('id') == u_id:
                                u_verified = entity.get('is_verified', False)
                    if not u_verified and actor.get('is_verified'):
                        u_verified = True

                    # 3. Metadata
                    p_url = story.get('permalink_url') or story.get('wwwURL') or story.get('url')
                    if not p_url: p_url = f"https://www.facebook.com/{p_id}"

                    publish_time = ""
                    creation_time = story.get('creation_time') or find_node_by_key(story, 'creation_time')
                    if creation_time:
                        try: publish_time = datetime.fromtimestamp(int(creation_time)).strftime('%Y-%m-%d %H:%M:%S')
                        except: pass

                    text_content = extract_text_content(story)
                    metrics = extract_metrics(story)
                    
                    # 4. MEDIA & LINKS (Deep Scan)
                    media_data = extract_media_deep(story)
                    clean_media = "; ".join(list(media_data['media_urls']))

                    posts[p_id] = {
                        'post_id': p_id,
                        'post_url': p_url,
                        'author_name': u_name,
                        'author_id': u_id,
                        'publish_time': publish_time,
                        'text_content': text_content.replace('\n', ' ').strip(),
                        
                        'like_count': metrics['like'],
                        'love_count': metrics['love'],
                        'haha_count': metrics['haha'],
                        'wow_count': metrics['wow'],
                        'sad_count': metrics['sad'],
                        'angry_count': metrics['angry'],
                        'share_count': metrics['share'],
                        'comment_count': metrics['comment'],
                        
                        'video_view_count': metrics['views'],
                        'video_duration_sec': media_data['video_duration'],
                        'video_thumbnail_url': media_data['video_thumbnail'],
                        'media_urls': clean_media
                    }

                    if u_id and u_id not in users:
                        users[u_id] = {
                            'user_id': u_id,
                            'user_name': u_name,
                            'profile_url': u_url,
                            'profile_pic_url': u_pic,
                            'is_verified': u_verified
                        }
                    elif u_id and u_verified and not users[u_id]['is_verified']:
                        users[u_id]['is_verified'] = True
                             
            except Exception: continue
            
    return list(posts.values()), list(users.values())

def run_processing(filename):
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            har_data = json.load(f)

        posts, users = extract_fb_data(har_data)
        
        base_name = os.path.splitext(os.path.basename(filename))[0]
        dt_postfix = datetime.now().strftime('%Y%m%d_%H%M%S')
        
        p_csv = f"{base_name}_fbposts_{dt_postfix}.csv"
        u_csv = f"{base_name}_fbusers_{dt_postfix}.csv"

        if posts:
            pd.DataFrame(posts).reindex(columns=FB_POST_HEADER).to_csv(os.path.join(UPLOAD_PATH, p_csv), index=False)
        else:
            pd.DataFrame(columns=FB_POST_HEADER).to_csv(os.path.join(UPLOAD_PATH, p_csv), index=False)
            
        if users:
            pd.DataFrame(users).reindex(columns=FB_USER_HEADER).to_csv(os.path.join(UPLOAD_PATH, u_csv), index=False)
        else:
            pd.DataFrame(columns=FB_USER_HEADER).to_csv(os.path.join(UPLOAD_PATH, u_csv), index=False)

        return {
            "status": "success",
            "posts_count": len(posts),
            "users_count": len(users),
            "files": [p_csv, u_csv]
        }
    except Exception as e:
        return {"status": "error", "message": str(e)}

@app.route("/api/process", methods=["POST"])
def process_api():
    if 'file' not in request.files: return jsonify({"error": "No file"}), 400
    file = request.files['file']
    if file.filename == '': return jsonify({"error": "No file"}), 400
    filepath = os.path.join(UPLOAD_PATH, file.filename)
    file.save(filepath)
    return jsonify(run_processing(filepath))

if __name__ == "__main__":
    if len(sys.argv) > 1:
        print(json.dumps(run_processing(sys.argv[1])))
    else:
        app.run(host='0.0.0.0', port=5000)
