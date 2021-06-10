require 'journey.rb'
require 'oystercard'

describe Journey do
  let(:journey) { Journey.new }
  let(:max_limit) { Oystercard::MAX_LIMIT }
  let(:min_fare) { Oystercard::MINIMUM_FARE }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:token_top_up) { 20 }
  let(:fare) { 10 }

  it 'knows whether a journey is complete' do
    expect(subject).to respond_to(:complete?)
  end

  it "knows when it is on a journey" do
    expect(subject.journey).to eq(true || false)
  end

  context "when making a journey" do
    it 'stores the entry station' do

    end
  end

  # it should be responsible for starting a journey, finishing a journey,
  # calculating the fare of a journey,
  # and returning whether or not the journey is complete.

  # it "text" do
  #
  # end
end
