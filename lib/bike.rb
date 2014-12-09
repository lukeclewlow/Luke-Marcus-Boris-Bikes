class Bike

	def initialize
		fix!() # offers class method with instance variable @false
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

