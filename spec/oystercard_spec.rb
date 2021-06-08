require 'oystercard'
# require 'station'

describe Oystercard do
let(:card) { Oystercard.new }
let(:max_limit) { Oystercard::MAX_LIMIT }
let(:min_fare) { Oystercard::MINIMUM_FARE }
let(:entry_station) { double :entry_station }
let(:exit_station) { double :exit_station }
let(:token_top_up) { 20 }
let(:fare) { 10 }
# let(:balance) { Oystercard::@balance }

  it 'has a default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'can track whether it is on a journey or not' do
    expect(card).to respond_to(:in_journey?)
  end

  context 'when not on a journey' do
    it 'can be touched in' do
      card.top_up(min_fare)
      card.touch_in(entry_station)
      expect(card.in_journey?).to be(true)
    end

    describe '#top_up' do
      it 'can top up' do
        card.top_up(token_top_up)
        expect(card.balance).to eq(token_top_up)
      end

      it 'raises an error if top_up would take balance over 90' do
        top_up_amount = max_limit + 1
        expect{ card.top_up(top_up_amount) }.to raise_error "Cannot top up: balance would be above #{max_limit} maximum"
      end
    end

    it 'raises an error if try to touch in without the minimum fare' do
      expect{card.touch_in(entry_station)}.to raise_error "Cannot touch in: not enough funds"
    end

    it 'has a default empty journey history' do
      expect(card.journeys).to be_empty
    end

    it 'returns the previous journey' do
      card.top_up(token_top_up)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.journeys).to eq({entry_station => exit_station})
    end

    it 'returns a list of all journeys' do
      card.top_up(token_top_up)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      card.touch_in("station 3")
      card.touch_out("station 4")
      expect(card.journeys).to eq({
        entry_station => exit_station,
        "station 3" => "station 4"})
    end
  end

  context 'when on a journey' do
    it 'can be touched out' do
      expect(card.touch_out(exit_station)).to eq(nil)
    end

    it 'deducts a fare from the balance' do
      card.top_up(token_top_up)
      expect{card.deduct(fare)}.to change{card.balance}.from(token_top_up).to(token_top_up - fare)
    end

    it 'stores the entry station' do
      card.top_up(token_top_up)
      expect(card.touch_in(entry_station)).to eq(entry_station)
    end

    it 'forgets the entry station on touch_out' do
      card.touch_out(exit_station)
      expect(card.entry_station).to eq(nil)
    end
  end

describe 'it can do stuff with station objects' do
  let(:name) { double :name }
  let(:station) { Station.new(name) }
  let(:zone) { double :zone }

    it 'can return the name of a station object' do
      # expect(station.name).to eq name
      station_test = Station.new("Hendon")
      expect(station_test.name).to eq("Hendon")
    end

    # Need to figure out how to substitute hard code for doubles/stub here
    it 'can return the zone of a given station' do
      # allow(station.zone).to receive(name.to_s).and_return(1)
      station_test = Station.new("Hendon")
      expect(station_test.find_zone).to eq(4)
    end

    it 'can access the zone outside of the class' do
      station_test = Station.new("Waterloo")
      expect(station_test.find_zone).to eq(station_test.zone)
    end
end
  # it 'can return the zone'
end
