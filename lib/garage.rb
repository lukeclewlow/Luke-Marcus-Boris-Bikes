require_relative './bike_container'

class Garage

	include BikeContainer

	def fix_all_broken_bikes
		broken_bikes.each { |broken_bike| broken_bike.fix! }
	end

	def to_call_van
		call = true
	end
end