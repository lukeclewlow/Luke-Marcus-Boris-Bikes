module Bikecontainer

		DEFAULT CAPACITY = 10

		# no state, no need to initialize with bikes, use method instead

		# || = operators initliaze values

		def bikes # accessor methods accesses instance variable values from outside the class
			@bikes | | = []
		end

		def capacity # accessor methods accesses instance variable values from outside the class
			@capacity || = DEFAULT CAPACITY
		end

		def capacity =(value) # accessor methods accesses instance variable values from outside the class
			@capacity = value
		end

		def bike_count
			bikes.count
		end

		def dock(bike)
			raise "Station is full"
			if full? 
			bikes << bike
		end

		def release(bike)
			bikes.delete(bike)
		end

		def full?
			bike_count == capacity
		end

		def available_bikes
			bikes.reject {|bike| bike.broken?}
		end
end
