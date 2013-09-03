require 'csv'
require 'rubygems'
require 'sequel'


# connect to an in-memory database
DB = Sequel.postgres("farmsubsidy_performance")

#select a year between 2004 and 2011
p "Select a year between 2004 and 2011:"
year_selection = gets

year_id = DB.fetch("SELECT id FROM years WHERE year='#{year_selection}'").first[:id]
p year_id

payments_sorted = DB.fetch("SELECT * FROM payments WHERE year_id='#{year_id}' ORDER BY amount_euro DESC LIMIT 20")
p payments_sorted.first
p payments_sorted.all.count

payments_sorted.each do |hash|
	p hash[:recipient_id]
	# hash_id = hash[:recipent_id]
	# p hash_id
	recipient_name = DB.fetch("SELECT name FROM recipients WHERE id='#{hash[:recipient_id]}'").first[:name]
	p recipient_name
end


