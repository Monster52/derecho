class Formater
	attr_reader :city, :state

	def initialize city, state
		@city = city
		@state = state
	end

	def create_state_city_string
		"#{format_state(@state)}/#{format_city(@city)}"
	end

	private

		def format_state state
			state_city = ""
			state = state.upcase
		end

		def format_city city
			if city.length > 1
				fcity = city.split(" ")
				fcity.map(&:capitalize).join(" ").gsub(" ", "_")
			else
				city
			end
		end
end