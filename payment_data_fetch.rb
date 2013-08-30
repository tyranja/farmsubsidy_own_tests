require 'csv'
require 'bigdecimal'
require 'rubygems'
require 'sequel'


# connect to an in-memory database
DB = Sequel.postgres("farmsubsidy_development")


# create a dataset from the payment data
payment = DB[:payments]
year = DB[:years]

i = 0
payment_txt = CSV.open("data/cz_payment.txt", "r:UTF-8", :headers => true, :col_sep => ";") do |csv|
  csv.each do |row|
      print "." if i%100 == 0
      payment.insert(
        amount_euro: row['amountEuro'],
        year_id: # id from years table when year == row['year']
      # foreign_key(:recipient_id, :recipients)
      # foreign_key(:year_id, :years)
        
      )
    i += 1
  end
end