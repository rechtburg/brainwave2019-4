import argparse
from pythonosc.dispatcher import Dispatcher
from pythonosc import osc_server
from typing import List, Any
import time

def set_filter(address: str, *args: List[Any]) -> None:
    # We expect two float arguments
    if len(args) != 4:
        return

    # Check that address starts with filter
    if address[:28] != '/muse/elements/beta_relative':
        return

    print(f'{time.time()}, {args[0]}, {args[1]}, {args[2]}, {args[3]}')

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--ip", default="127.0.0.1", help="The ip to listen on")
    parser.add_argument("--port", type=int, default=5000, help="The port to listen on")
    args = parser.parse_args()

    dispatcher = Dispatcher()
    dispatcher.map("/muse/elements/beta_relative*", set_filter)  # Map wildcard address to set_filter function

    server = osc_server.ThreadingOSCUDPServer((args.ip, args.port), dispatcher)
    print("Serving on {}".format(server.server_address))
    server.serve_forever()
