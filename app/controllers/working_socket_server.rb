require 'socket'
require 'rexml/document'
include REXML

server = TCPServer.new 4444 # Server bind to port 2000
socket = server.accept
while line = socket.gets
  puts line
end
