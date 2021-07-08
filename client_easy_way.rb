require 'socket'

# socket = TCPSocket.new('baidu.com', 80)

# block method

Socket.tcp('baidu.com', 80) do | connection |
    connection.write('GET / HTTP/1.1\r\n')
    connection.close
end

# client = Socket.tcp('baidu.com', 80)