require "derecho/version"

  class Derecho
	require_relative 'formater'
	require 'httparty'
	require 'pry'

	attr_reader :city, :state, :message

	def initialize city, state
		@city = city
		@state = state
		@message = Formater.new(@city, @state)
	end

	def response
		wunderground_api_key = "2bbce63b5e0caa51"

		url = "http://api.wunderground.com/api/#{wunderground_api_key}/forecast10day/q/#{message.create_state_city_string}.json"
		response = HTTParty.get(url)
		response["forecast"].to_a
	end

	def get_advanced_weather_data
		daily_forecast_two = response[1][1]["forecastday"]
		daily_forecast_two.each do |day|
			weekday = day["date"]["weekday"]
			condition = day["conditions"]
			temp_high = day["high"]["fahrenheit"]
			temp_low = day["low"]["fahrenheit"]
			icon = day["icon"]
			icon_img = day["icon_url"]

			puts "#{weekday} will be #{condition} with a high of #{temp_high} and a low of #{temp_low}."
		end
	end

	def get_basic_weather_data
		daily_forecast = response[0][1]["forecastday"]
		daily_forecast.each do |day|
			if day["title"].length <= 10
				weather = []
				day_string = day["title"].split(' ')
				puts "#{day_string[0]} will be #{day["fcttext"]}"
			end
		end
	end

	# Derecho.new("long beach", "ms").get_advanced_weather_data
	# Derecho.new("new orleans", "la").get_basic_weather_data
end
