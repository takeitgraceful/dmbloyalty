require 'nokogiri'
require 'rubygems'

open("dmbloyalty.html") do |file|
  file.seek(0, IO::SEEK_END) # rewinds file to the end
  loop do                    # inifinite loop
    changes = file.read
    parsed_data = Nokogiri::HTML.parse(changes)
    unique_data = parsed_data.xpath("//*[@state='Paid']/@manager_uid")
    unless changes.empty?    # file.read returns "" if there is not more data to read
      print unique_data  # reads only a additional part of the file
    end
    sleep 1.0        # sleep for a second; without it script would use 100% of processor
  end
end
