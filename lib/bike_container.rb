class EmptyContainerError < Exception
	def message
		"There are no bikes"
	end
end


module BikeContainer # this is a module, not a class, it cannot be instatiated, i.e. no BikeContainer.new, no state

		DEFAULT_CAPACITY = 10

		# bikes & capacity use || = operators to initliaze values, so when any other method calls capacity()
		# it will return the value of the instance variable @ capacity, HOWEVER, if @capacity is nil, it will assign DEFAULT_CAPACITY to it first
		# this enables us to call the method capacity() before the value was set, it will be set to the default the first time it's accepted ?

		BROKEN_BIKES = Proc.new { |bike| bike.broken? } # created Proc of a block for select & rejecting from bikes array

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
			raise EmptyContainerError if eempty? #will raise an error(defined at the top) if our array is empty when release is called on it
			bikes.delete(bike)
		end

		def full? # capacity refers to the accessor method capacity() defined above
			bike_count == capacity
		end

		def eempty?			#asks if our array is empty returns boolean
			bikes.empty?
		end

		def available_bikes
			bikes.reject(&BROKEN_BIKES)
		end

		def broken_bikes
			bikes.select(&BROKEN_BIKES)
		end


		def collect_all_broken_bikes_from station
			station.broken_bikes.each do |bike| # station object calls method each on array of broken bikes
				self.dock bike  # now docks bike to self, i.e. whoever call the method
				station.release(bike) # station object release bike
			end
		end

		

		
end

