# missing requirement, need planet created to feed into solar system.
require "colorize"

class Planet
  attr_accessor :name, :diameter, :moon, :orbit_period, :orbit_distance, :mass

  def initialize(name_var, diameter_var, moon_var, orbit_distance_var, orbit_period_var, mass_var)
    @name = name_var
    @diameter = diameter_var
    @moon = moon_var
    @orbit_period = orbit_period_var
    @orbit_distance = orbit_distance_var
    @mass = mass_var
  end

  def hash  #puts all user input into array and output Array
    hash = Hash.new
    hash.store(:name, @name)
    hash.store(:diameter, @diameter)
    hash.store(:moon, @moon)
    hash.store(:orbit_period, @orbit_period)
    hash.store(:mass, @mass)
    return hash
  end
end

#Creates a solar system with a given name
class SolarSystem
  attr_accessor :name, :solar_hash
  def initialize(name)
    @name = name
    @solar_hash = {}
  end

  def add_one_planet(one_planet_hash) # can add one planet to the solar system, returns hash
    @solar_hash.store(one_planet_hash[:name], one_planet_hash)
    return @solar_hash
  end

  def add_many_planets(many_planets_hash) #can add many planet hashes, returns larger hash
    many_planets_hash.each do |key, value|
      @solar_hash.store(key, value)
    end
    return @solar_hash
  end
end

# Below are tests
new_solar_system = SolarSystem.new("Ann")

first_planet = Planet.new("fake_planet", 100, 100, 100, 100, 100)
second_planet = Planet.new("another_planet", 100, 100, 100, 100, 100)

planets_hash = {first_planet.hash[:name] => first_planet,
                second_planet.hash[:name] => second_planet}

puts new_solar_system.add_one_planet(first_planet.hash)
puts new_solar_system.add_many_planets(planets_hash)
