require_relative './bike_container'

class Van

	include BikeContainer

	def called_by?(location)
		location #put hash here with keys as station and garage and values as true and false
	end



end