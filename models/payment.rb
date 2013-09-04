require 'rubygems'
require 'sequel'

# connect to an in-memory database
DB = Sequel.postgres("farmsubsidy_performance")

# Create a Payments model.
class Payment < Sequel::Model; 
	many_to_one :recipients
end

