require 'rubygems'
require 'socket'
require 'nokogiri'

server = TCPServer.new 4444
html        = File.open("dmbloyalty.html")
parsed_data = Nokogiri::HTML.parse(html)

loop do
  Thread.start(server.accept) do |client|
    while line = client.gets
      # open and write to a file with ruby
      open('dmbloyalty.html', 'a+') { |f|
        f.puts line}
    end
  client.close
end
end
