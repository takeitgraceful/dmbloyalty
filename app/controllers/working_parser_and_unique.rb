require 'socket'
require 'nokogiri'
require 'rubygems'

server = TCPServer.new 4444
html        = File.open("dmbloyalty.html")
parsed_data = Nokogiri::HTML.parse(html)
lines = File.open("parseddmbloyalty.html").to_a
new_data = parsed_data.xpath("//@manager_uid")
text = []
input = File.read("parseddmbloyalty.html")
text = input.split("\n")
stringeddata = text.to_s

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
open('parseddmbloyalty.html', 'a+') { |f|
  f.puts new_data
}
open('stringeddata', 'a+') { |f|
  f.puts text.uniq
}
end
