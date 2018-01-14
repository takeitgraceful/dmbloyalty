require 'socket'
require 'rexml/document'
include REXML

server = TCPServer.new 4444 # Server bind to port 2000
loop do
  client = server.accept    # Wait for a client to connect
  client.puts "Hey Buddy 2 !"
  client.close
end
