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
    p "All Payments in total are #{self.values[:amount_euro]}"
    #a method for adding all the payments
    total_sum = 0
    i = 0
    while i < 20
      total_sum += Payment.all[i].amount_euro.to_i
      i += 1
    end
    p "total sum:  #{total_sum.to_i}"
    p "For adding up all payments the Computer needs #{Time.now - beginning} seconds"
  end

end

