require 'csv'
require 'rubygems'
require 'sequel'

# connect to an in-memory database
DB = Sequel.postgres("farmsubsidy_performance_add_top_payments")

# connect to the models
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + "/models/*.rb").each{|f| require f}

# connect to payments total table and add data to the database
total_payment = DB[:payments_total]

Year.all.each do |year|
  Recipient.all.each do |recipient|
    recipient.payments.where(year_id: year(:year_id)).inject(0.0) do |sum,payment|
      sum = sum + payment.amount_euro
      total_payment.insert(
        recipient_id: payment.recipient_id,
        "amount_euro_+ #{year(:year)}".to_sym => sum
        )
    end
  end
end
