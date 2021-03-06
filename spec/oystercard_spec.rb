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

  context 'when not on a journey' do
    it 'can be touched in' do
      card.top_up(min_fare)
      expect(card.touch_in(entry_station)).to eq(entry_station)
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
      card.top_up(token_top_up)
      card.touch_in(entry_station)
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

  end

end
