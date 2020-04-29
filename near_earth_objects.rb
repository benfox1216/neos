# require 'faraday'
require 'figaro'
require 'pry'
require_relative 'neo_service'
require_relative 'get_neo_info'

# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class NearEarthObjects
  def find_neos_by_date(date)
    parsed_asteroids_data = get_neos(date)

    {
      asteroid_list: GetNeoInfo.formatted_asteroid_data(parsed_asteroids_data),
      biggest_asteroid: GetNeoInfo.largest_asteroid_diameter(parsed_asteroids_data),
      total_number_of_asteroids: GetNeoInfo.total_number_of_asteroids(parsed_asteroids_data)
    }
  end
  
  private
    def get_neos(date)
      neo = NeoService.new
      data = neo.access_neo_data(date)
      data[:near_earth_objects][:"#{date}"]
    end
end
