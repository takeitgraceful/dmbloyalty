require 'socket'

server = TCPServer.new 4444
loop do
  Thread.start(server.accept) do |client|
    while line = client.gets
    puts line
  end
  client.close
end
end
