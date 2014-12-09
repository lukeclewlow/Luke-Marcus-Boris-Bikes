class DockingStation
DEFAULT_CAPACITY = 20 #this is an arbitrary value at the moment because we're taking our value from the test
					

	def initialize(options = {}) # options hash is the argument for the initialzer
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		# creates instance variable @capacity, looks in argument options, looks at DEFAULT_CAPACITY
		# sees it set at 20, now @capacity = 20
		# with :capacity as key we're able set value in the test, so @capacity = value in rspec
		@bikes = [] 
	end


	def bike_count
		@bikes.count
		end

	def dock(bike)
		# if the capacity is reached raise excption
		raise "Station is full" if full?
		@bikes << bike # add bike to array of bike
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def full?
		# bike_count = method for giving us the bike count
		bike_count == @capacity # =DEFAULT_CAPACITY = 20
	end

end

