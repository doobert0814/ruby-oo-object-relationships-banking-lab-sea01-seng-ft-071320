
class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount , status = "pending")
    @sender = sender
    @amount = amount
    @receiver = receiver
    @status = status
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status ="complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && sender.balance > amount && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status ="reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      end
    
  end
end
