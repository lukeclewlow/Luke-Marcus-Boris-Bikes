require 'bike'

# describing functionality of class Bike
describe Bike do

	let(:bike){Bike.new}

	# feature that we expect (behaviour)
	it "should not be broken after we create it" do
		the_bike =Bike.new
		expect(the_bike).not_to be_broken
	end
	
	it "should be able to break" do 
		bike = Bike.new
		bike.break!
		expect(bike).to be_broken
	end
	
end