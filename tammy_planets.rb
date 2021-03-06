class Planet

  attr_reader :name, :radius, :orbital_period, :distance_from_sun

  def initialize(attrs)
    @name              = attrs[:name]
    @radius            = attrs[:radius]
    @orbital_period    = attrs[:orbital_period]
    @distance_from_sun = attrs[:distance_from_sun]
  end

end

mercury = Planet.new name: "Mercury", radius: "1,516 days", orbital_period: "88", distance_from_sun: "35,980,000"
mars    = Planet.new name: "Mars", radius: "2,106", orbital_period: "687 days", distance_from_sun: "141,600,000"
pluto   = Planet.new name: "Pluto", radius: "737", orbital_period: "248 years", distance_from_sun: "3,670,050,000"
earth   = Planet.new name: "Earth", radius: "3,959", orbital_period: "365 days", distance_from_sun: "92,960,000"
venus   = Planet.new name: "Venus", radius: "3,760", orbital_period: "225 days", distance_from_sun: "67,240,000"
jupiter = Planet.new name: "Jupiter", radius: "43,441", orbital_period: "12 years", distance_from_sun: "483,800,000"
saturn  = Planet.new name: "Saturn", radius: "36,184", orbital_period: "29 years", distance_from_sun: "890,700,000"
uranus  = Planet.new name: "Uranus", radius: "15,759", orbital_period: "84 years", distance_from_sun: "1,787,000,000"
neptune = Planet.new name: "Neptune", radius: "15,299", orbital_period: "165 years", distance_from_sun: "2,795,000,000"

planets = {
  "Mercury" => mercury,
  "Mars" => mars,
  "Pluto" => pluto,
  "Earth" => earth,
  "Venus" => venus,
  "Jupiter" => jupiter,
  "Saturn" => saturn,
  "Uranus" => uranus,
  "Neptune" => neptune
}

class SolarSystem

  attr_reader :planets

  def initialize(attr)
    @planets = attr
  end

  def find_planet(answer)
    @planets[answer]
  end

  def present?(answer)
    true if @planets.keys.include?(answer)
  end

end

s = SolarSystem.new(planets)

puts "What planet would you like to learn about?"
puts "Here are your options: #{planets.keys.join(', ')}."

while true
  answer = gets.chomp.capitalize
  if s.present?(answer)
    the_planet = s.find_planet(answer)
    print "Here is some of the info about #{answer}: it's orbital period is #{the_planet.orbital_period}, "
    puts "radius is #{the_planet.radius} miles, "
    puts "the distance from sun is #{the_planet.distance_from_sun} miles."
    puts "Give me another planet! You can also type either done or exit."
  elsif answer == 'Done' || answer == 'Exit'
    break
  else
    puts "Please clarify which planet you're interested to learn about?"
  end
end
