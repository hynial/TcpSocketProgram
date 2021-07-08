require 'socket'

Socket.tcp_server_loop(4481) do | connection |
    p connection.remote_address
    connection.close
end

