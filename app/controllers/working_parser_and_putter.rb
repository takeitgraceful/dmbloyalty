require 'nokogiri'
require 'rubygems'


html        = File.open("dmbloyalty.html")
parsed_data = Nokogiri::HTML.parse(html)

puts parsed_data.xpath("//@manager_uid")

#@doc = Nokogiri::XML(File.open("dmbloyalty.xml"))
#@doc.xpath("//@price")
