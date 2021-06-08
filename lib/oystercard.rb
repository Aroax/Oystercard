class Oystercard
  attr_reader :balance, :entry_station
  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MINIMUM_FARE = 1

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

  def in_journey?
    @entry_station != nil
  end

  def touch_in(entry_station)
    fail "Cannot touch in: not enough funds" if no_funds?
    @entry_station = entry_station
  end

  def touch_out
    @entry_station = nil
  end

  private

  def busted?(top_up)
    @balance + top_up > MAX_LIMIT
  end

  def no_funds?
    @balance < MINIMUM_FARE
  end
end
