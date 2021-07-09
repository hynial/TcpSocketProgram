require 'socket'
require 'openssl'

# socket = TCPSocket.new('0.0.0.0', 4481)
socket = TCPSocket.new('hynial.cn', 443)

ssl_socket = OpenSSL::SSL::SSLSocket.new(socket)
ssl_socket.connect

ssl_socket.read