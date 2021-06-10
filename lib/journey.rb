class Journey
attr_reader :on_journey, :entry_station, :exit_station

  def initialize(entry_station)
    @on_journey = true
    @entry_station = entry_station
  end

  def top_up(value)
    fail "Cannot top up: balance would be above #{MAX_LIMIT} maximum" if busted?(value)
    @balance += value
  end

  def complete?
    
  end

  def set_exit(new_exit_station)
    @exit_station = new_exit_station
  end

  private

  def busted?(top_up)
    @balance + top_up > MAX_LIMIT
  end
  
end
