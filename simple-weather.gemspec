Gem::Specification.new do |s|
  s.name        = 'simple-weather'
  s.version     = '0.0.1'
  s.date        = '2015-12-18'
  s.summary     = "Simple Weather App"
  s.description = "A simple weather app that gets current weather and forecast info by city"
  s.authors     = ["Scotty Runyan"]
  s.email       = 'runyans7@gmail.com'
  s.files       = ["lib/simple_weather.rb", "config/environment.rb", "lib/simple-weather/cli.rb", "lib/simple-weather/weather_data.rb"]
  s.homepage    =
    'http://rubygems.org/gems/simple-weather-cli-gem'
  s.license       = 'MIT'

  s.executables << "get-weather"

  s.add_development_dependency "pry"
  s.add_development_dependency "json"
  s.add_development_dependency "open-uri"
end