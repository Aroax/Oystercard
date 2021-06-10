class Journey
attr_reader :journey

  def initialize
    @journey = true
  end

  def top_up(value)
    fail "Cannot top up: balance would be above #{MAX_LIMIT} maximum" if busted?(value)
    @balance += value
  end

  def complete?
  end

  private

  def busted?(top_up)
    @balance + top_up > MAX_LIMIT
  end
  
end
