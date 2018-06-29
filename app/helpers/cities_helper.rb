require 'net/http'

module CitiesHelper
	def get_weather_forecast(city_id)
		Rails.cache.fetch("#{city_id}", expires_in: 10.minutes) do
			puts 'PPPPPPPPPPP'
			uri = URI("http://api.openweathermap.org/data/2.5/weather?id=#{city_id}
											&appid=9be65de5a09d3a66723fefc333e3d973&units=metric")
			response = Net::HTTP.get_response(uri)

			JSON.parse(response.body) 
		end
	end
end
