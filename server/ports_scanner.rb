require 'socket'

PORT_RANGE = 20..444
HOST = 'hynial.cn'
TIME_TO_WAIT = 5

sockets = PORT_RANGE.map do |port|
    socket = Socket.new(:INET, :STREAM)
    remote_addr = Socket.pack_sockaddr_in(port, HOST)
    
    begin
        socket.connect_nonblock(remote_addr)
    rescue Errno::EINPROGRESS
    end
    socket
end

puts "from:#{Time.now}"
expiration = Time.now + TIME_TO_WAIT
puts "end:#{expiration}"

loop do
    _, writable, _ = IO.select(nil, sockets, nil, expiration - Time.now)
    break unless writable

    writable.each do |socket|
        begin
            socket.connect_nonblock(socket.remote_address)
        rescue Errno::EISCONN
            puts "#{HOST}:#{socket.remote_address.ip_port} accept"
            sockets.delete(socket)
        rescue Errno::EINVAL
            sockets.delete(socket)
        end
    end
end


# https://github.com/tarcieri/nio4r