require 'pg'

# Output a table of current connections to the DB
conn = PG.connect( dbname: 'my_database_development' )
@card_test = "222"
example = conn.exec("INSERT INTO cards(card_used,created_at,updated_at) VALUES (#{@card_test},NOW(),NOW());")
example.each do |row|
    puts row
end
