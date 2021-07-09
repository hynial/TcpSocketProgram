require 'socket'

Socket.tcp_server_loop(4481) do |connection|
    urgent_data = connection.recv(1, Socket::MSG_OOB)
    puts "UrgentData:#{urgent_data}"
    data = connection.readpartial(1024)
    puts "NormalData:#{data}"
end
