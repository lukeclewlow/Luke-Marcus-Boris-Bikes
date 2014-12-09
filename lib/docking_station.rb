class DockingStation

	def initialize
		@bikes = []
	end

	def bike_count
		@bikes.count
		end

	def dock(bike)
		@bikes << bike # add bike to array of bike
	end

	


end