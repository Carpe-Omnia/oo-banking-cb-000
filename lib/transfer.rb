class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if @status != "pending"
      return "transfer already completed"
    elsif @sender.valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end
end
