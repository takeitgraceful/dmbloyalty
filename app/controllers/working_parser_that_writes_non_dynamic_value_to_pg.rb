require 'nokogiri'
require 'rubygems'
require 'pg'

conn = PG.connect( dbname: 'my_database_development' )

open("dmbloyalty.html") do |file|
  file.seek(0, IO::SEEK_END) # rewinds file to the end
  loop do                    # inifinite loop
    changes = file.read
    parsed_data = Nokogiri::HTML.parse(changes)
    unique_data = parsed_data.xpath("//*[@state='Paid']/@manager_uid")
    @card_test = 2222444
    #@card_test = unique_data
    #example = conn.exec("INSERT INTO cards(card_used,created_at,updated_at) VALUES (#{@card_test},NOW(),NOW());")
    unless changes.empty?  # file.read returns "" if there is not more data to read
      print unique_data && conn.exec("INSERT INTO cards(card_used,created_at,updated_at) VALUES (#{@card_test},NOW(),NOW());")  # reads only a additional part of the file
    end
    sleep 1.0        # sleep for a second; without it script would use 100% of processor
  end
#  @card_test = unique_data
#  conn = PG.connect( dbname: 'my_database_development' )
#  example = conn.exec("INSERT INTO cards(card_used,created_at,updated_at) VALUES (#{@card_test},NOW(),NOW());")
#  example.each do |row|
#      puts row
#    end
end