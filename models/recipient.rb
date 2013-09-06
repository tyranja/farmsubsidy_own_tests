# Create a Recipients model.
class Recipient < Sequel::Model
  many_to_one :years
  one_to_many :payments

  def total_payments_by_recipient(recipient_id)
    beginning = Time.now
    # find payments by recipient
    recipient_payments = Payment.where(recipient_id: recipient_id)

    #add the payments together
    total_recipient_payments = 0
    recipient_payments.each do |payment|
      total_recipient_payments += payment
    end
  end

end
