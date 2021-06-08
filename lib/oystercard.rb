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

  def in_journey?
    @entry_station != nil
  end

  def touch_in(entry_station)
    fail "Cannot touch in: not enough funds" if no_funds?
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    build_journey(exit_station)
  end

  private

  def build_journey(exit_station)
    @journeys[@entry_station] = exit_station
    @entry_station, @exit_station = nil
  end

  def busted?(top_up)
    @balance + top_up > MAX_LIMIT
  end

  def no_funds?
    @balance < MINIMUM_FARE
  end
end
