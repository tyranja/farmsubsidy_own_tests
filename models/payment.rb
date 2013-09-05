require 'rubygems'
require 'sequel'

# connect to an in-memory database
DB = Sequel.postgres("farmsubsidy_performance")

# Create a Payments model.
class Payment < Sequel::Model; 
	many_to_one :recipients


  def total_payments
    beginning = Time.now
    p "All Payments in total are #{Payment.all.count}"
    #a method for adding all the payments
    total_sum = 0
    i = 0
    while i < Payment.all.count
      total_sum += Payment.all[i].amount_euro.to_i
      i += 1
    end
    p "total sum:  #{total_sum.to_i}"
    p "For Payment all count the Computer needs #{Time.now - beginning} seconds"
  end

  def total_payments
    beginning = Time.now
    p "All Payments in total are #{Payment.all.count}"
    #a method for adding all the payments
    total_sum = 0
    i = 0
    while i < Payment.all.count
      total_sum += Payment.all[i].amount_euro.to_i
      i += 1
    end
    p Payment.all[0].amount_euro.to_i
    p Payment.all[1].amount_euro.to_i
    p Payment.all[2].amount_euro.to_i
    p "total sum:  #{total_sum.to_i}"
    puts "For Payment all count the Computer needs #{Time.now - beginning} seconds"
  end

end

