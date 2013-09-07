require 'csv'
require 'rubygems'
require 'sequel'
#

# connect to an in-memory database
DB = Sequel.postgres("farmsubsidy_performance_add_top_payments")

# create a dataset from the recipient data
recipient = DB[:recipients]

payments = DB[:payments]

p payments.all
p recipient.all

