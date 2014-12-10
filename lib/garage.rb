class Garage



	def initialize
		@bikes = []
	end

	def capacity
		@capacity = 20
	end

	def bike_count
		@bikes.count
	end

	def dock(bike)
		@bikes << bike
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		@bikes.reject{ |bike| bike.broken? }
	end

end