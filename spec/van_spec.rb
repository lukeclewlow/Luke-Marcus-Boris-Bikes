
require 'van'

describe Van do
	
	let(:bike) {Bike.new}
	let(:garage) {Garage.new}
	let(:van) {Van.new}

	it "should be able to tell when the garage calls it" do
		expect(van).to be_called_by(garage)
		
	end

	# it "should be able to be called by the dock" do
	# 	expect(van.to_be_called_by(station)).to eq(station)
	# end


end