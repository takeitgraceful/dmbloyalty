
require 'socket'
require 'rexml/document'

include REXML

file = File.new("bibliography.xml")

doc = Document.new(file)

doc.elements.each("POSOutput/Order/MainOrder/ProductDetail/Product") { |element| puts element.attributes["price"] }
