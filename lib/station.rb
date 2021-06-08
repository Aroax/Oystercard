class Station
  attr_reader :name, :zone

  def initialize(name)
    @name = name
    @zones_list = {
      1 => ["Waterloo", "Victoria"],
      4 => ["Hendon", "Mill Hill"],
      5 => "Test"}
    @zone = find_zone
  end

  def find_zone
    @zones_list.each { |k, v| return k if v.include?(@name) }
  end

# puts @zones.key(@name)

end

# station = Station.new("Victoria")
# station.zone
