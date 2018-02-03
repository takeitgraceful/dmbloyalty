require 'socket'
require 'nokogiri'
require 'rubygems'

server = TCPServer.new 4444
html        = File.open("dmbloyalty.html")
parsed_data = Nokogiri::HTML.parse(html)
lines = File.open("parseddmbloyalty.html").to_a
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
#open('parseddmbloyalty.html', 'w') { |f|
#  f.puts parsed_data.xpath("//*[@state='Paid']/@manager_uid")
#}
end
