require 'socket'

puts("Hello world")

server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(128)

print 'Limit open files by process:'
p  Process.getrlimit(:NOFILE)

# Process.setrlimit(Process.getrlimit(:NOFILE)[1])

p  Process.getrlimit(:NOFILE)

# loop do
#     connection, _= server.accept
#     print 'Remote address: '
#     p connection.remote_address
#     connection.close
# end

connection, _= server.accept
print 'Remote address: '
p connection.remote_address

cp = connection.dup

connection.shutdown

connection.close

# cp will be collected as garbage.

puts("goodbye")

# test it
# echo 'kd' | nc localhost 4481

# ri command to get documents about objects & methods
# ri
# Addrinfo

print 'Connection class: '

p connection.class

print 'Server fileno: '

p server.fileno

print 'Connection fileno: '

p connection.fileno

print 'Local address: '

p connection.local_address

print 'Remote address: '

p connection.remote_address