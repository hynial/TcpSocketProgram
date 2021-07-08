require 'socket'

client = Socket.new(:INET, :STREAM)
remote_addr = Socket.pack_sockaddr_in(80, 'baidu.com')

begin
    client.connect_nonblock(remote_addr)
rescue Errno::EINPROGRESS
    # progress
rescue Errno::EALREADY
    # already
rescue Errno::ECONNREFUSED
    # refuse
end