require 'socket'

server = TCPServer.new(4481)

# 禁用Nagle算法。告诉服务器不带延迟，即时发送。
server.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)


