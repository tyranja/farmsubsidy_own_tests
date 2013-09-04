require 'rubygems'
require 'sequel'

# connect to an in-memory database
DB = Sequel.postgres("farmsubsidy_performance")

# Create a Recipients model.
class Recipient < Sequel::Model; 
	many_to_one :years
	one_to_many :payments
end
