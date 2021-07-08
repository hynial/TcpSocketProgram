require 'socket'

server = TCPServer.new(4481)

Socket.accept_loop(server) do | connection |
    # do action
    p connection.remote_address
    connection.close
end

puts('goodbye')