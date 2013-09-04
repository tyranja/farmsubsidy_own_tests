require 'rubygems'
require 'sequel'

# connect to an in-memory database
DB = Sequel.postgres("farmsubsidy_performance")

# Create a Year model.
class Year < Sequel::Model; 
	one_to_many :recipients
end


