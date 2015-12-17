class SimpleWeather

  def initialize
    @user_city = nil
    @weather_data = nil
    start
  end

  def app_header
    system 'clear'
    puts "------------------------------ SIMPLE WEATHER APP ------------------------------" 
    puts ""
  end

  def start
    city_search
    current_or_forecast
  end

  def current_or_forecast

    user_choice = nil

    loop do
      app_header
      puts "1. Get current weather"
      puts "2. Get forecast"
      user_choice = gets.chomp
      break if user_choice == "1" || user_choice == "2"
      puts "Invalid Entry. Please try again."
    end

    @weather_data = get_weather_data(@user_city)

    if user_choice == "1"
      display_current_weather
    else
      display_forecast
    end

  end

  def city_search
    app_header
    puts "Which city would you like to get the weather for?"

    @user_city = gets.chomp
  end

  def get_weather_data(city)
    @weather_data = WeatherData.find_by_city(city)
  end

  def display_current_weather
    app_header
    puts "#{ @weather_data.query["results"]["channel"]["item"]["title"]}"
    puts ""
    puts "Sky Condition:    #{@weather_data.query["results"]["channel"]["item"]["condition"]["text"]}"
    puts "Temperature:      #{@weather_data.query['results']['channel']['item']['condition']['temp']} degrees"
    puts "Wind:             #{@weather_data.query['results']['channel']['wind']['speed']} mph from #{@weather_data.query['results']['channel']['wind']['direction']} degrees"
    loop_or_quit
  end

  def display_forecast
    app_header
    @weather_data.query['results']['channel']['item']['forecast'].each do |day|
      sleep 0.5
      puts ""
      puts "Forecast for #{day["day"]} #{day["date"]}"
      puts "-----------------------------------"
      puts "Sky Condition:  #{day["text"]}"
      puts "High Temp:      #{day["high"]}"
      puts "low Temp:       #{day["low"]}"
    end
    loop_or_quit
  end

  def loop_or_quit
    puts ""
    puts 'Please type "back", "new search" or "exit".'
    choice = gets.chomp.downcase

    case choice
    when 'back'
      current_or_forecast
    when 'new search'
      start
    when 'exit'
      puts 'Goodbye'
    else
      puts 'Invalid input. Please try again.'
      loop_or_quit
    end
  end

end