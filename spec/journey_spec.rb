require 'journey.rb'
require 'oystercard'

describe Journey do
  let(:journey) { Journey.new }
  let(:max_limit) { Oystercard::MAX_LIMIT }
  let(:min_fare) { Oystercard::MINIMUM_FARE }
  let(:penalty_fare) { Journey::PENALTY_FARE }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:token_top_up) { 20 }
  let(:fare) { 10 }


  it 'knows whether a journey is complete' do
    # journey = Journey.new(entry_station)
    journey.set_entry(entry_station)
    journey.set_exit(exit_station)
    expect(journey.on_journey).to eq(false)
  end

  it "knows when it is on a journey" do
    # journey = Journey.new(entry_station)
    expect(journey.on_journey).to eq(true || false)
  end

  context "when making a journey" do
    it 'stores the entry station' do
      # journey = Journey.new(entry_station)
      journey.set_entry(entry_station)
      expect(journey.entry_station).to eq(entry_station)
    end

    it 'store the exit station' do
      # journey = Journey.new(entry_station)
      journey.set_exit(exit_station)
      expect(journey.exit_station).to eq(exit_station)
    end

    describe '#calculate_fare' do
      it 'calculates the fare of the journey' do
        # journey = Journey.new("Victoria")
        journey.set_entry(entry_station)
        journey.set_exit(exit_station)
        expect(journey.calculate_fare).to be_an_instance_of(Integer)
      end

      it "returns penalty fare if there is neither entry nor exit station" do
        # journey = Journey.new("Victoria")
        journey.set_entry(entry_station)
        expect(journey.calculate_fare).to eq(penalty_fare)
      end
    end


  end



  # it should be responsible for starting a journey, finishing a journey,
  # calculating the fare of a journey,
  # and returning whether or not the journey is complete.

end
