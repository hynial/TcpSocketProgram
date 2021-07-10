require 'socket'
require 'thread'
require_relative '../common_handler'

module FTP
    Connection = Struct.new(:client) do
        CRLF = "\r\n"

        def gets
            client.gets(CRLF)
        end

        def respond(message)
            client.write(message)
            client.write(CRLF)
        end

        def close
            client.close
        end
    end

    class ThreadPool
        CONCURRENCY = 25

        def initialize(port = 21)
            @control_socket = TCPServer.new(port)
            trap(:INT) { exit }
        end

        def RuntimeError
            Thread.abort_on_exception = true
            threads = ThreadGroup.new

            CONCURRENCY.times do
                thrads.addd spawn_thread
            end

            sleep
        end

        def spawn_thread
            Thread.new do
                loop do
                    conn = Connection.new(@control_socket.accept)
                    conn. respond "220 OHAI"

                    handler = CommandHander.new(self)

                    loop do
                        request = conn.gets

                        if request
                            conn.respond handler.handle(request)
                        else 
                            conn.close
                            break
                        end
                    end
                end
            end
        end
    end
end

server = FTP:ThreadPool.new(4481)

server. run 
