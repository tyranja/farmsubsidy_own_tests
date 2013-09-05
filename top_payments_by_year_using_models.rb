require 'csv'
require 'rubygems'
require 'sequel'

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + "/models/*.rb").each{|f| require f}

# top_payments will be an aray of hashes with the final results
# eg [{rank: 1, name: "horst", amount: 234556}, {...}]
top_payments = []

#select a year between 2004 and 2011
p "Select a year between 2004 and 2011:"
year_selection = gets

# find the year_id from the Years model
year_id = Year.where(year: year_selection.to_i).first[:id]

# find payments by year, order them by amount, and return the first 20
payments_sorted = Payment.where(year_id: year_id).
                                reverse_order(:amount_euro).
                                limit(20)

# find recipient name, create an index, shove it into top_payments hash
payments_sorted.each_with_index do |payment, index|
  recipient_name = Recipient.where(id: payment[:recipient_id]).first[:name].gsub("\"", "")
  top_payments << {rank: index+1, name: recipient_name, amount: payment[:amount_euro]}
end

# [{:rank=>1, :name=>"Zemědělsko-obchodní družstvo Žichlínek", :amount=>#<BigDecimal:2cf64b0,'0.62048908E6',18(18)>}, {..}
# p top_payments

CSV.open("top_payments.csv", "w", :force_quotes => true) do |csv|
  i = 0
  csv << ["rank","name","amount"]
  while i < top_payments.length
    csv << [top_payments[i][:rank],top_payments[i][:name],top_payments[i][:amount].to_i]
    i += 1
  end
end

# payments_sorted.all.first.values.methods.sort.each do |method_name|
#   p method_name
# end

# p payments_sorted.class
# p payments_sorted
# p payments_sorted.first.class
# p payments_sorted.first

# p payments_sorted.first.recipient_id

# p payments_sorted.first.columns
p payments_sorted.first.values[:amount_euro]
# p payments_sorted.first.values.merge({:newKey => "newValue"})
# payments_sorted.first.values[:newKey1] = "newValue"
# payments_sorted.insert(:amount_euro=>"5")
# payments_sorted.update(:amount_euro=>"6")

p payments_sorted.first
# <Payment @values={:id=>519, :amount_euro=>#<BigDecimal:1e5fc80,'0.6E1',9(18)>, :recipient_id=>25482, :year_id=>8}>

p payments_sorted.all
#[#<Payment @values={:id=>6113, :amount_euro=>#<BigDecimal:2e36fa0,'0.5155196E6',18(18)>, :recipient_id=>13183, :year_id=>7}>, ..]

payments_sorted.all.total_payments
# p payments_sorted.all.count


