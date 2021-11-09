import asyncio
import pickle

clients = []
HEADER_SIZE = 10


class SimpleChatClientProtocol(asyncio.Protocol):
    def connection_made(self, transport):
        self.transport = transport
        self.peername = transport.get_extra_info("peername")
        print("connection_made: {}".format(self.peername))
        clients.append(self)

    def data_received(self, data):
        data = pickle.loads(data)
        print(data)

        match data:
            case 'shutdown':
                self.shutdown()

            case 'open':
                self.open_note()

            case 'view':
                self.view_note()

            case 'edit':
                self.edit_note()

            case 'delete':
                self.delete_note()

    def connection_lost(self, ex):
        print("connection_lost: {}".format(self.peername))
        clients.remove(self)

    def shutdown(self):
        pass

    def open_note(self):
        pass

    def view_note(self):
        pass

    def edit_note(self):
        pass

    def delete_note(self):
        pass


if __name__ == '__main__':
    print("starting up..")

    loop = asyncio.get_event_loop()
    coro = loop.create_server(SimpleChatClientProtocol, port=43110)
    server = loop.run_until_complete(coro)

    for socket in server.sockets:
        print("serving on {}".format(socket.getsockname()))

    loop.run_forever()
