import json
import os
import re
from functools import partial
from datetime import datetime
from pprint import pprint

def load (name=''):
    src='C:/Users/radzi/Downloads/messages/inbox/'
    #directory = os.fsencode(src)
    list_json=[]
    for file in os.listdir(src):
        filename = os.fsdecode(file)
        src_full = os.path.join(src, filename+"/message.json")
        #print (src_full)
        fix_mojibake_escapes = partial(
            re.compile(rb'\\u00([\da-f]{2})').sub,
            lambda m: bytes.fromhex(m.group(1).decode()))

        with open(src_full,'rb') as bdata:
            if os.stat(src_full).st_size != 0:
                dane = fix_mojibake_escapes(bdata.read())
                dane_r=json.loads(dane, encoding='utf8',strict=False)
                for i in range (len(dane_r['messages'])):
                    #dane_r['messages'][i]['timestamp_ms']=datetime.utcfromtimestamp(dane_r['messages'][i]['timestamp_ms']).strftime('%Y-%m-%d %H:%M:%S')
                    dane_r['messages'][i]['date_ms'] =datetime.utcfromtimestamp(int(dane_r['messages'][i]['timestamp_ms']/1000)).strftime('%Y-%m-%d %H:%M:%S')
                #print(type(dane))
                #pprint(dane_r['participants'])
                list_json.append(dane_r)
        #print(os.path.join(src, filename))
    #print(list_json[-1]['participants'])
    return list_json
#sda
lista=[]
czasy=[]
wiadomosci=[]
if not lista:
    lista=load()
    for l in lista:
        for i in range (len(l['messages'])):
            czasy.append(l['messages'][i]['date_ms'])
            wiadomosci.append(l.get('messages')[i].get('content'))
lista[-1].get('messages')[2].get('content')#['timestamp_ms']
wiadomosci[-990]