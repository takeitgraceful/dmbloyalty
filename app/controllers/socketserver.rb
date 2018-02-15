#require 'socket'
#require 'nokogiri'
#require 'rubygems'

#server = TCPServer.new 4444
#html        = File.open("dmbloyalty.html")
#parsed_data = Nokogiri::HTML.parse(html)

#loop do
#  Thread.start(server.accept) do |client|
#    while line = client.gets
#      open('dmbloyalty.html', 'a+') { |f|
#        f.puts line}
#    end
#  client.close
#end
#end
