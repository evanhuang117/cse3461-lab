import socket
import sys
import os
import pickle
import asyncio
from utils.command import \
    Command, \
    shutdown, \
    view, \
    add_todo, \
    delete_todo, \
    delete_list
import logging
logging.basicConfig(
    level=logging.DEBUG,
    format='%(name)s: %(message)s',
    stream=sys.stderr,
)
log = logging.getLogger('main')

sdfjkds
valid_commands = {'shutdown': shutdown,
                  'new': new_list,
                  'view': view,
                  'add': add_todo,
                  'delete todo': delete_todo,
                  'delete list': delete_list
                  }


def create_socket():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        print("Socket successfully created")
    except socket.error as err:
        print("socket creation failed with error %s" % (err))
    return s


def validate_input(input: str) -> bool:
    return input in valid_commands.keys()


def send_msg(sock, msg) -> None:
    msg = pickle.dumps(cmd)
    print(f'sending {msg}')
    sock.send(msg)


if __name__ == '__main__':
    hostname = os.getenv('SERVER_HOSTNAME')
    port = int(os.getenv('SERVER_PORT'))
    try:
        host_ip = socket.gethostbyname(hostname)
        print(host_ip)
    except socket.gaierror:
        # this means could not resolve the host
        print("there was an error resolving the host")
        sys.exit()

    # connecting to the server
    sock = create_socket()
    sock.connect((host_ip, port))

    while(True):
        cmd = input()
        if validate_input(cmd):
            print('Please enter a filename')
            filename = f'{input()}.todo'
            send_msg(sock, view(filename))
            send_msg(valid_commands[cmd]())
        else:
            print('Invalid command, valid commands are:')
            [print(s) for s in valid_commands.keys()]
