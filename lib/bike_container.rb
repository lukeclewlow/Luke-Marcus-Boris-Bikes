module BikeContainer # this is a module, not a class, it cannot be instatiated, i.e. no BikeContainer.new, no state

		DEFAULT_CAPACITY = 10

		# bikes & capacity use || = operators to initliaze values, so when any other method calls capacity()
		# it will return the value of the instance variable @ capacity, HOWEVER, if @capacity is nil, it will assign DEFAULT_CAPACITY to it first
		# this enables us to call the method capacity() before the value was set, it will be set to the default the first time it's accepted ?

		def bikes # accessor methods accesses instance variable values from outside the class
		# accesses @bikes instance variable from DockingStation class
			@bikes ||= []
		end

		def capacity # accessor methods accesses instance variable values from outside the class
			# accesses @capacity instance variable from DockingStation class 
			@capacity ||= DEFAULT_CAPACITY
		end

		def capacity=(value) # accessor methods accesses instance variable values from outside the class
			# accesses @capacity instance variable from DockingStation class 
			@capacity = value # value of module method capacity is instance variable capacity set from DockingStation class
		end

		# accessor methods encapsulate the implemetation inside the module, no longer manipulate the instance variables directly
		# see full?

		def bike_count
			bikes.count
		end

		def dock(bike)
			raise "Station is full" if full? 
			bikes << bike
		end

		def release(bike)
			bikes.delete(bike)
		end

		def full? # capacity refers to the accessor method capacity() defined above
			bike_count == capacity
		end

		def available_bikes
			bikes.reject {|bike| bike.broken?}
		end
end
