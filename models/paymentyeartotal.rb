# Create a Total Payment model.
class PaymentYearTotal < Sequel::Model
  many_to_one :recipient
  many_to_one :year

  def number
    self.count
  end

end

