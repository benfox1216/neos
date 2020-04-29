require 'faraday'
require 'pry'

class NeoService
  def access_neo_data(date)
    data = create_api_object(date).get('/neo/rest/v1/feed')
    JSON.parse(data.body, symbolize_names: true)
  end
  
  private
    def create_api_object(date)
      Faraday.new(
        url: 'https://api.nasa.gov',
        params: { start_date: date, api_key: ENV['nasa_api_key']}
      )
    end
end