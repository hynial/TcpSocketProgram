require 'socket'

one_kb = 1024
Socket.tcp_server_loop(4481) do |connection|
    # puts connection.read

    while data = connection.read(one_kb) do 
        puts data
    end
    connection.close
end

# echo gekko | nc localhost 4481
# tail -f /var/log/system.log | nc localhost 4481