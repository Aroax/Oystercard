class Oystercard
  attr_reader :balance, :in_journey
  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false


  end

  def top_up(value)
    fail "Cannot top up: balance would be above #{MAX_LIMIT} maximum" if busted?(value)
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Cannot touch in: not enough funds" if no_funds?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def busted?(top_up)
    @balance + top_up > MAX_LIMIT
  end

  def no_funds?
    @balance < MINIMUM_FARE
  end
end
