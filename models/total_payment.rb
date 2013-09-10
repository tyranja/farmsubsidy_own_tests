# Create a Total Payment model.
class TotalPayment < Sequel::Model
  many_to_many :recipient
  many_to_many :year
  one_to_many :payments

end

