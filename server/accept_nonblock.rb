require 'socket'

server = TCPServer.new(4481)


loop do
    begin
        connection = server.accept_nonblock()
        puts connection.read
    rescue Errno::EAGAIN
        # do priority thing
        # puts 'important first'
        retry
    end
end