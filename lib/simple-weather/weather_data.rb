require 'open-uri'
require 'json'

class WeatherData

  attr_accessor :query

  def initialize(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value)
    end
  end

  def self.find_by_city(city)
    request = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text=%22#{city}%22)&format=json"

    response = open(request).read

    weather_data = JSON.parse(response)

    WeatherData.new(weather_data)
  end

end