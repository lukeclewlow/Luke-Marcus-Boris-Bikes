class Bike

	def initialize
		@broken = false
	end

	def broken?
		@broken
		end

	def break! #exclamation for changing the state of the object
		@broken = true
	end

end

#NEW CHANGE!!!