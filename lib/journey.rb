require_relative 'oystercard'

class Journey
attr_reader :on_journey, :entry_station, :exit_station
MINIMUM_FARE = Oystercard::MINIMUM_FARE
PENALTY_FARE = 6

  def initialize
    @on_journey = true
    @entry_station = ""
    @exit_station = ""
    @zone_fares = {}
  end

  def top_up(value)
    fail "Cannot top up: balance would be above #{MAX_LIMIT} maximum" if busted?(value)
    @balance += value
  end

  def complete?

  end

  def set_entry(entry_station)
    @on_journey = true
    @entry_station = entry_station
  end

  def set_exit(exit_station)
    @on_journey = false
    @exit_station = exit_station
  end

  def calculate_fare
    if (@entry_station == "" || @exit_station == "")
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end

  private

  # def busted?(top_up)
  #   @balance + top_up > MAX_LIMIT
  # end

end
