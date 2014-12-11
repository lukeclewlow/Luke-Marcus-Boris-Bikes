require_relative './bike_container'

class Van

	include BikeContainer

	def called_by?(location)
		location #put hash here with keys as station and garage and values as true and false
	end


	
	def dock_all_broken_bikes
			broken_bikes.each { |broken_bike| dock(broken_bike) }
		end

end