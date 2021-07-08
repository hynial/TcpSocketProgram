require 'socket'

# nc -l localhost 4481
client = TCPSocket.new('localhost', 4481)

payload = 'Hello world! ' * 1000

begin
    loop do
        data_s = client.write_nonblock(payload)
        break if data_s >= payload.size 
        
        payload = payload.slice!(0, data_s)

        IO.select(nil, [client])
        
    end

rescue Errno::EAGAIN
    IO.select(nil, [client])
    retry
end
