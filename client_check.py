# museから脳波データを受信し機械学習モデルに通した結果をリアルタイムでProcessingに発信する
import argparse
from pythonosc.dispatcher import Dispatcher
from pythonosc import osc_server
from pythonosc import osc_message_builder
from pythonosc import udp_client
from typing import List, Any

parser2 = argparse.ArgumentParser()
parser2.add_argument("--ip", default="127.0.0.1", help="The ip of the OSC server")
parser2.add_argument("--port", type=int, default=5001, help="The port the OSC server is listening on")
args2 = parser2.parse_args()

client = udp_client.UDPClient(args2.ip, args2.port)

def output(ch1, ch2, ch3, ch4):
    #editing

    msg = osc_message_builder.OscMessageBuilder(address='/move')
    msg.add_arg((ch1*2-0.5)//1)
    msg = msg.build()
    print("Sending", msg.dgram)
    client.send(msg)
    

def set_filter(address: str, *args: List[Any]) -> None:
    # We expect four arguments
    if len(args) != 4:
        return

    # Check that address starts with filter
    if address[:28] != '/muse/elements/beta_relative':
        return

    print(f'{args[0]}, {args[1]}, {args[2]}, {args[3]}')
    output(args[0], args[1], args[2], args[3])

parser = argparse.ArgumentParser()
parser.add_argument("--ip", default="127.0.0.1", help="The ip to listen on")
parser.add_argument("--port", type=int, default=5000, help="The port to listen on")
args = parser.parse_args()

dispatcher = Dispatcher()
dispatcher.map("/muse/elements/beta_relative*", set_filter)  # Map wildcard address to set_filter function

server = osc_server.ThreadingOSCUDPServer((args.ip, args.port), dispatcher)
print("Serving on {}".format(server.server_address))
server.serve_forever()
