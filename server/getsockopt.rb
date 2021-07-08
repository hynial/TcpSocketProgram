require 'socket'

socket =  TCPSocket.new('baidu.com', 80)
# opt = socket.getsockopt(:SOCKET, :TYPE)
opt = socket.getsockopt(Socket::SOL_SOCKET, Socket::SO_TYPE)
puts opt.int == Socket::SOCK_STREAM
puts opt.int == Socket::SOCK_DGRAM


server = TCPServer.new('localhost', 4481)
server.setsockopt(:SOCKET, :REUSEADDR, true)
puts server.getsockopt(:SOCKET, :REUSEADDR)
