# server.pyの動作確認用のクライアント
import argparse
import time
import random

from pythonosc import osc_message_builder
from pythonosc import udp_client

parser = argparse.ArgumentParser()
parser.add_argument("--ip", default="127.0.0.1", help="The ip of the OSC server")
parser.add_argument("--port", type=int, default=5000, help="The port the OSC server is listening on")
args = parser.parse_args()

client = udp_client.UDPClient(args.ip, args.port)

for x in range(60):
    msg = osc_message_builder.OscMessageBuilder(address='/muse/elements/beta_relative')
    msg.add_arg(random.random())
    msg.add_arg(random.random())
    msg.add_arg(random.random())
    msg.add_arg(random.random())
    msg = msg.build()
    print("Sending", msg.dgram)
    client.send(msg)
    time.sleep(1)
