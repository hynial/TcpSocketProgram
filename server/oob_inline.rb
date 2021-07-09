require 'socket'

Socket.tcp_server_loop(4481) do | connection |
    connection.setsockopt :SOCKET, :OOBINLINE, true

    ur_data = connection.readpartial(1024)
    puts ur_data
    data = connection.readpartial(1024)
    puts data

end