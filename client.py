# museから脳波データを受信し機械学習モデルに通した結果をリアルタイムでProcessingに発信する
import argparse
from pythonosc.dispatcher import Dispatcher
from pythonosc import osc_server
from pythonosc import osc_message_builder
from pythonosc import udp_client
from typing import List, Any
from sklearn.externals import joblib
import pandas as pd
import time
import numpy as np

parser2 = argparse.ArgumentParser()
parser2.add_argument("--ip", default="10.213.196.17", help="The ip of the OSC server")
parser2.add_argument("--port", type=int, default=5001, help="The port the OSC server is listening on")
args2 = parser2.parse_args()

client = udp_client.UDPClient(args2.ip, args2.port)

classifier = joblib.load('classifier.sav')

data = []

#t = time.time()

def output(ch1, ch2, ch3, ch4, data):
    #newt = time.time()
    #dt = newt - t
    #t = newt
    inner = ch3 - ch2
    outer = ch4 - ch1
    if len(data) == 10:
        '''
        if dt > 0.1:
            data = data[4:].append(inner/2).append(outer/2).append(inner/2).append(outer/2)
        else:
            data = data[2:].append(inner).append(outer)
'''
        data = data[2:].append(inner).append(outer)
        msg = osc_message_builder.OscMessageBuilder(address='/move')
        msg.add_arg(classifier.predict(pd.DataFrame(data).T))
        msg = msg.build()
        print("Sending", msg.dgram)
        client.send(msg)
        return data
    else:
        '''
        if dt > 0.1:
            data.append(inner/2).append(outer/2).append(inner/2).append(outer/2)
        else:
            data.append(inner).append(outer)'''
        return data.append(inner).append(outer)  

def set_filter(data address: str, *args: List[Any]) -> None:
    # We expect four arguments
    if len(args) != 4:
        return

    # Check that address starts with filter
    if address[:28] != '/muse/elements/beta_relative':
        return

    print(f'{args[0]}, {args[1]}, {args[2]}, {args[3]}')
    return output(args[0], args[1], args[2], args[3], data)

parser = argparse.ArgumentParser()
parser.add_argument("--ip", default="127.0.0.1", help="The ip to listen on")
parser.add_argument("--port", type=int, default=5000, help="The port to listen on")
args = parser.parse_args()

dispatcher = Dispatcher()
dispatcher.map("/muse/elements/beta_relative*", data = set_filter)  # Map wildcard address to set_filter function

server = osc_server.ThreadingOSCUDPServer((args.ip, args.port), dispatcher)
print("Serving on {}".format(server.server_address))
server.serve_forever()
