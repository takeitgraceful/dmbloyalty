require 'socket'
require 'rexml/document'
include REXML

server = TCPServer.new 4444



loop do
  Thread.start(server.accept) do |client|
    while line = client.gets
      # open and write to a file with ruby
      open('dmbloyalty.html', 'a+') { |f|
        f.puts line
      }
    end
  client.close
end
end
#doc.elements.each("POSOutput/Order/MainOrder/ProductDetail/Product") { |element| puts element.attributes["price"] }
