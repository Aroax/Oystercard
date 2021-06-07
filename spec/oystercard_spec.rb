require 'oystercard'
describe Oystercard do
let(:card) { Oystercard.new }
let(:max_limit) { Oystercard::MAX_LIMIT }
let(:min_fare) { Oystercard::MINIMUM_FARE }
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
      card.touch_in
      expect(card.in_journey?).to be(true)
    end

    describe '#top_up' do
      it 'can top up' do
        top_up_amount = 50
        card.top_up(top_up_amount)
        expect(card.balance).to eq(50)
      end

      it 'raises an error if top_up would take balance over 90' do
        top_up_amount = max_limit + 1
        expect{ card.top_up(top_up_amount) }.to raise_error "Cannot top up: balance would be above #{max_limit} maximum"
      end
    end

    it 'raises an error if try to touch in without the minimum fare' do
      expect{card.touch_in}.to raise_error "Cannot touch in: not enough funds"
    end
  end

  context 'when on a journey' do
    it 'can be touched out' do
      expect(card.touch_out).to eq(false)
    end

    it 'deducts a fare from the balance' do
      fare = 10
      top_up_amount = 20
      card.top_up(top_up_amount)
      expect{card.deduct(fare)}.to change{card.balance}.from(top_up_amount).to(top_up_amount - fare)
    end
  end
end
