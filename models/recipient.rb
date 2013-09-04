require 'rubygems'
require 'sequel'

# connect to an in-memory database
DB = Sequel.postgres("farmsubsidy_performance")

# Create a Recipients model.
class Recipient < Sequel::Model; 
	many_to_one :years
	one_to_many :payments

	def total_payments do 
		#a method for adding all the payments for one recipient

	end
		
	end
end
