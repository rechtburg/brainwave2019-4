# client.pyの動作確認用サーバ
import argparse
from pythonosc.dispatcher import Dispatcher
from pythonosc import osc_server
from typing import List, Any
import time

t = time.time()

def set_filter(address: str, *args: List[Any]) -> None:
    # We expect one arguments
    if len(args) != 1:
        return

    # Check that address starts with filter
    if address[:29] != '/move/':
        return

    print(f'{time.time() - t}, {args[0]}')

parser = argparse.ArgumentParser()
parser.add_argument("--ip", default="127.0.0.1", help="The ip to listen on")
parser.add_argument("--port", type=int, default=5001, help="The port to listen on")
args = parser.parse_args()

dispatcher = Dispatcher()
dispatcher.map("/move/*", set_filter)  # Map wildcard address to set_filter function

server = osc_server.ThreadingOSCUDPServer((args.ip, args.port), dispatcher)
print("Serving on {}".format(server.server_address))
server.serve_forever()
