require 'station'

describe Station do

  let(:name) { double :name }
  let(:station) { Station.new(name) }
  let(:zone) { double :zone }

    it 'can return the name of a station object' do
      # expect(station.name).to eq name
      station_test = Station.new("Hendon")
      expect(station_test.name).to eq("Hendon")
    end

    # Need to figure out how to substitute hard code for doubles/stub here
    it 'can return the zone of the given station' do
      # allow(station.zone).to receive(name.to_s).and_return(1)
      station_test = Station.new("Hendon")
      expect(station_test.zone).to eq(4)
    end

end
