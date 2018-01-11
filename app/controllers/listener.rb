require 'socket'

s = TCPSocket.new '192.168.1.80', 4444

while line = s.gets # Read lines from socket
  puts line         # and print them
end

s.close             # close socket when done
