class Oystercard
  attr_reader :balance
  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(value)
    fail "Cannot top up: balance would be above #{MAX_LIMIT} maximum" if busted?(value)
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  private

  def busted?(top_up)
    @balance + top_up > MAX_LIMIT
  end

end
