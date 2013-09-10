require 'csv'
require 'rubygems'
require 'sequel'

# connect to an postgres database
DB = Sequel.postgres("farmsubsidy_performance_add_top_payments")

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + "/models/*.rb").each{|f| require f}

p PaymentYearTotal.number


