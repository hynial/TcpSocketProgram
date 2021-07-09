require 'socket'

socket = TCPSocket.new 'localhost', 4481

socket.send '!2', Socket::MSG_OOB

socket.write 'first'
socket.write 'second'


# tcp support only one byte urgent data[out-of-band]. if more than only the last byte be sent.