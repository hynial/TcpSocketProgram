require 'socket'

servers = Socket.tcp_server_sockets(4481)

Socket.accept_loop(servers) do | connection |
    # do
    puts('hello world')
    p connection.remote_address
    connection.close
end

