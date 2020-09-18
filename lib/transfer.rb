require 'pry'
class Transfer
  attr_accessor :sender, :name, :balance, :receiver, :status, :amount 
  
  def initialize(name, balance, status, amount = 50)
    @name = name 
    @balance = balance
    @status = "pending"
    @sender = self.name
    @receiver = self.balance
    @amount = amount
  end
  
  def valid?
    receiver.valid? && sender.valid?
  end
  
  def execute_transaction
    binding.pry 
    if valid? && self.status == "pending" && sender.balance > amount 
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
end
