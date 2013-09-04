require 'rubygems'
require 'sequel'

# connect to an in-memory database
DB = Sequel.postgres("farmsubsidy_performance")

# Create a Year model.
class Year < Sequel::Model; end

# Create a Recipients model.
class Recipients < Sequel::Model; end

# Create a Payments model.
class Payments < Sequel::Model; end

