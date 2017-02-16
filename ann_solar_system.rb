require "colorize"

class Planet
  attr_accessor :name, :diameter, :moon, :orbit_period, :orbit_distance, :mass

  def initialize (name_var, diameter_var, moon_var, orbit_distance_var, orbit_period_var, mass_var)
    @name = name_var
    @diameter = diameter_var
    @moon = moon_var
    @orbit_period = orbit_period_var
    @orbit_distance = orbit_distance_var
    @mass = mass_var
    @solar_system = # this hash identifies existing solar system information
    {:mars =>
        {:diameter => 6805,
        :moons => 2,
        :orbit_distance => 1.52,
        :orbit_period => 687,
        :mass => 6.42 * (10**23)},
    :earth =>
        {:diameter => 12714 ,
        :moons => 1,
        :orbit_distance => 149598262,
        :orbit_period => 365.26,
        :mass => 5.79 * (10**24)},
    :mercury =>
        {:diameter => 4879,
        :moons => 0,
        :orbit_distance => 57909227,
        :orbit_period => 88,
        :mass => 3.3 * 10**23},
    :venus =>
        {:diameter => 12104,
        :moons => 0,
        :orbit_distance => 109209475,
        :orbit_period => 225,
        :mass => 4.87 * (10**24)},
    :jupiter =>
        {:diameter => 142984,
        :moons => 67,
        :orbit_distance => 778340821,
        :orbit_period => 4333,
        :mass => 1.90 * (10**27)},
    :saturn =>
        {:diameter => 120536,
        :moons => 62,
        :orbit_distance => 1426666422,
        :orbit_period => 10756,
        :mass => 5.68 * (10**26)},
    :uranus =>
        {:diameter => 51118,
        :moons => 27,
        :orbit_distance => 2870658186,
        :orbit_period => 30687,
        :mass => 8.68 * (10**25)},
    :neptune =>
        {:diameter => 49528,
        :moons => 14,
        :orbit_distance => 4498396441,
        :orbit_period => 60190,
        :mass => 1.02 * (10**26)}
  }
    end

      def name #this method gives the planet a name
        if @solar_system.keys.include?(@name.to_sym)
          puts "#{@name} is one of the 8 planets in our solar system."
        else
          puts "#{@name} is not one of the 8 planets in our solar system."
        end
      end

      def parameter parameter_var #this method returns a specific parameter if available
        parameter = ["diameter", "moons" "orbit_distance", "orbit_period", "mass"]
        if parameter.include?(parameter_var)
          if @solar_system.include?(@name.to_sym)
            return @solar_system[@name.to_sym][parameter_var.to_sym]
          else
            puts "you should know this, you gave me this information"
          end
        else
          puts "Sorry, don't have this parameter information"
        end
      end

      def all_data #displays all planet data, if planet exists, displays what is "on file", if not, displays input
        if @solar_system.keys.include?(@name.to_sym)
          puts "here is all available data on #{@name}"
          puts "  - diameter: #{@solar_system[@name.to_sym][:diameter]}"
          puts "  - moons: #{@solar_system[@name.to_sym][:moons]}"
          puts "  - orbit distance: #{@solar_system[@name.to_sym][:orbit_distance]}"
          puts "  - orbit period: #{@solar_system[@name.to_sym][:orbit_period]}"
          puts "  - orbit mass: #{@solar_system[@name.to_sym][:mass]}"
        else
          puts "here is all available data on #{@name}"
          puts "  - diameter: #{@diameter}"
          puts "  - moons: #{@moon}"
          puts "  - orbit distance: #{@orbit_distance}"
          puts "  - orbit period: #{@orbit_period}"
          puts "  - orbit mass: #{@mass}"
        end
      end
    end

#below are all tests
# new_planet = Planet.new("fake_planet", 100, 100, 100, 100, 100)
# puts new_planet.name
# puts new_planet.parameter("mass")
# puts new_planet.all_data


#functionality within the Solarsystem class should replace the Planet class, because the Solarsystem class can also "create" planets and add it to the solar system hash
class Solarsystem
  attr_accessor :solarsystem_name, :solarsystem_hash, :many_planets, :distance_from_sun

  def initialize (name) # initialize a new solar system with a name as the argument
      @solarsystem_name = name
      @solarsystem_hash = #stores existing solar system informtion in a hash
      {:mars =>
          {:diameter => 6805,
          :moons => 2,
          :orbit_distance => 1.52,
          :orbit_period => 687,
          :mass => 6.42 * (10**23),
          :distance_from_sun => 1000},
      :earth =>
          {:diameter => 12714 ,
          :moons => 1,
          :orbit_distance => 149598262,
          :orbit_period => 365.26,
          :mass => 5.79 * (10**24),
          :distance_from_sun => 200},
      :mercury =>
          {:diameter => 4879,
          :moons => 0,
          :orbit_distance => 57909227,
          :orbit_period => 88,
          :mass => 3.3 * 10**23,
          :distance_from_sun => 8000},
      :venus =>
          {:diameter => 12104,
          :moons => 0,
          :orbit_distance => 109209475,
          :orbit_period => 225,
          :mass => 4.87 * (10**24),
          :distance_from_sun => 500},
      :jupiter =>
          {:diameter => 142984,
          :moons => 67,
          :orbit_distance => 778340821,
          :orbit_period => 4333,
          :mass => 1.90 * (10**27),
          :distance_from_sun => 10000},
      :saturn =>
          {:diameter => 120536,
          :moons => 62,
          :orbit_distance => 1426666422,
          :orbit_period => 10756,
          :mass => 5.68 * (10**26),
          :distance_from_sun => 98888},
      :uranus =>
          {:diameter => 51118,
          :moons => 27,
          :orbit_distance => 2870658186,
          :orbit_period => 30687,
          :mass => 8.68 * (10**25),
          :distance_from_sun => 5},
      :neptune =>
          {:diameter => 49528,
          :moons => 14,
          :orbit_distance => 4498396441,
          :orbit_period => 60190,
          :mass => 1.02 * (10**26),
          :distance_from_sun => 90}
    }
  end

  def name # displays the name of the solar system
    puts @solarsystem_name
  end

  def add_one_planet #this is adding one planet at a time if it's not in existing hash
    puts "I need info from you, what's the planet's name?"
    name_var = gets.chomp.downcase.to_sym
    if @solarsystem_hash.keys.include?(name_var)
      puts "that planet is already in the list, here are all of them:"
      solarsystem_hash.each do |key, value|
        puts "  - #{key}"
      end
    else # gets each planets's information one by one and adds to hash
      new_planet = {
        :diameter => nil,
        :moons => nil,
        :orbit_distance => nil,
        :orbit_period => nil,
        :mass => nil,
        :distance_from_sun => nil}
        puts "okay, I need more information from you"
        new_planet.each do |key, value|
          puts "what's #{name_var}'s #{key}:".colorize(:red)
          user_input = gets.chomp
          new_planet[key] = user_input
        end
        @solarsystem_hash[name_var] = new_planet
      end
    end

    def add_planets (planets_hash) # adds a hash of a group of planets along with their information
      planets_hash.each do |planet, planet_info|
        @solarsystem_hash[planet] = planet_info
      end
    end

    def all_data
      puts "There are #{@solarsystem_hash.length} planets in this solar system."
      n = 0
      @solarsystem_hash.each do |planet, info| #this displays all data in the solar system hash
        puts "#{n += 1}. #{planet} information:"
        info.each do |info, detail|
          puts "  #{info}: #{detail}"
          # puts "#{info[:moons]} moon(s), #{info[:diameter]} diameter, #{info[:orbit_distance]} orbit distance, #{info[:orbit_period]} orbit period, #{info[:mass]} mass, #{info[:distance_from_sun]} from the sun\n"
        end
      end
    end

    def how_far (planet1, planet2)
      planet1 = @solarsystem_hash[planet1][:distance_from_sun]
      planet2 = @solarsystem_hash[planet2][:distance_from_sun]
      puts "They are #{(planet1 - planet2).abs} km apart"
    end
end


# below are all tests
# my_solarsystem = Solarsystem.new("ann")
# puts my_solarsystem.name
# my_solarsystem.add_one_planet
# group_of_planets = {
#   :first_planet =>
#         {:diameter => 1000,
#         :moons => 1000,
#         :orbit_distance => 1000,
#         :orbit_period => 1000,
#         :mass => 1000,
#         :distance_from_sun => 0},
#   :second_planet =>
#         {:diameter => 1000,
#         :moons => 1000,
#         :orbit_distance => 1000,
#         :orbit_period => 1000,
#         :mass => 1000,
#         :distance_from_sun => 0}}
# my_solarsystem.add_planets(group_of_planets)
# my_solarsystem.how_far(:mars, :earth)
# my_solarsystem.all_data
