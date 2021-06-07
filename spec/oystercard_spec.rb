require 'oystercard'
describe Oystercard do
let(:card) { Oystercard.new }
let(:max_limit) { Oystercard::MAX_LIMIT }
# let(:balance) { Oystercard::@balance }

  it 'has a default balance of 0' do
    expect(subject.balance).to eq(0)
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

  it 'deducts a fare from the balance' do
    fare = 10
    card.top_up(20)
    expect{card.deduct(fare)}.to change{card.balance}.from(20).to(10)
  end

end
