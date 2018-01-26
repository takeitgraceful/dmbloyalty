require 'socket'
require 'nokogiri'
require 'rubygems'

server = TCPServer.new 4444
html        = File.open("dmbloyalty.html")
parsed_data = Nokogiri::HTML.parse(html)
lines = File.open("parseddmbloyalty.html").to_a
unique_data = parsed_data.xpath("//@manager_uid")

loop do
  Thread.start(server.accept) do |client|
    while line = client.gets
      # open and write to a file with ruby
      open('dmbloyalty.html', 'a+') { |f|
        f.puts line
      }
      open('parseddmbloyalty.html', 'a+') { |f|
        f.puts unique_data
      }
    end
  client.close
end
end
