require 'nokogiri'
require 'rubygems'
require 'pg'


conn = PG.connect( dbname: 'my_database_development' )
open("dmbloyalty.html") do |file|
  file.seek(0, IO::SEEK_END) # rewinds file to the end
  loop do                    # inifinite loop
    changes = file.read
    parsed_data = Nokogiri::HTML.parse(changes)
    unless changes.empty?    # file.read returns "" if there is not more data to read
      @unique_data = parsed_data.xpath("//*[@state='Paid']/@manager_uid")
      example = conn.exec("INSERT INTO cards(card_used,created_at,updated_at) VALUES (#{@unique_data},NOW(),NOW());")
      example.each do |row|
          puts row
        end
    end
    sleep 1.0        # sleep for a second; without it script would use 100% of processor
  end
end

#conn = PG.connect(:dbname => 'db1')
#conn.prepare('statement1', 'insert into table1 (id, name, profile) values ($1, $2, $3)')
#conn.exec_prepared('statement1', [ 11, 'J.R. "Bob" Dobbs', 'Too much is always better than not enough.' ]
