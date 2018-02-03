require 'nokogiri'
require 'rubygems'


html        = File.read("dmbloyalty.html")
parsed_data = Nokogiri::HTML.parse(html)

while true
puts parsed_data.xpath("//*[@state='Paid']/@manager_uid")
sleep 5
end
#{}"XMLDependency/@name|XMLDependency/@area"

#xpath("//x[//z]/@name")
#/Credit_code_parents/Credit_Term_parent[@Credit_Term_Code='4']/@NativeDescription
#//Credit_Term_parent[@Credit_Term_Code='4']/@NativeDescription
#/catalog/items/item[colorId = /catalog/colors/color/@id]/title
#puts parsed_data.xpath("//@manager_uid")
#'//applications/application[@mode='3']'/@name
#state="Paid"
#@doc = Nokogiri::XML(File.open("dmbloyalty.xml"))
#@doc.xpath("//@price")
#puts parsed_data.xpath("//@manager_uid")
