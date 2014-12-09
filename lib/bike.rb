class Bike

	def initialize
		@broken = false #can be changed everywhere in the class
	end


	def broken? 
		@broken
		end

	def break! #exclamation for changing the state of the class, convention
		@broken = true
	end

	def fix!
		@broken = false
	end

end

