require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :journeys
  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @journeys = {}
  end

  def top_up(value)
    fail "Cannot top up: balance would be above #{MAX_LIMIT} maximum" if busted?(value)
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

# Extracted in_journey? method behaviour to Journey class

  def touch_in(entry_station)
    fail "Cannot touch in: not enough funds" if no_funds?
    @journey = Journey.new
    @journey.set_entry(entry_station)
  end

  def touch_out(exit_station)
    @journey.set_exit(exit_station)
    deduct(@journey.calculate_fare)
    store_journey
  end

  private

  def store_journey
    @journeys[@journey.entry_station] = @journey.exit_station
    clear_journey
  end

  def clear_journey
    @journey.set_exit(nil)
    @journey.set_entry(nil)
  end

  def busted?(top_up)
    @balance + top_up > MAX_LIMIT
  end

  def no_funds?
    @balance < MINIMUM_FARE
  end
end
