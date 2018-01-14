require 'nokogiri'
require 'rubygems'


html        = File.open("dmbloyalty.html")
parsed_data = Nokogiri::HTML.parse(html)

puts parsed_data.xpath("//@price")

#@doc = Nokogiri::XML(File.open("dmbloyalty.xml"))
#@doc.xpath("//@price")
