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

	def get_basic_weather_data
		results = []
		daily_forecast = response[0][1]["forecastday"]
		daily_forecast.each do |day|
			if day["title"].length <= 10
				weather = []
				day_string = day["title"].split(' ')
				results.push("#{day_string[0]} will be #{day["fcttext"]}")
			end
		end
		results
	end

	def get_weekday
		results = []
		daily_forecast = response[1][1]["forecastday"]
		daily_forecast.each do |day|
			days = day["date"]["weekday"]

			results.push(days)
		end
		results
	end

	def get_icon
		results = []
		daily_forecast = response[1][1]["forecastday"]
		daily_forecast.each do |day|
			icons = day["icon_url"]

			results.push(icons)
		end
		results
	end

	def get_daily_highs
		results = []
		daily_forecast = response[1][1]["forecastday"]
		daily_forecast.each do |day|
			temp_high = day["high"]["fahrenheit"]

			results.push(temp_high)
		end
		results
	end

	def get_daily_lows
		results = []
		daily_forecast = response[1][1]["forecastday"]
		daily_forecast.each do |day|
			temp_low = day["low"]["fahrenheit"]

			results.push(temp_low)
		end
		results
	end	
end
