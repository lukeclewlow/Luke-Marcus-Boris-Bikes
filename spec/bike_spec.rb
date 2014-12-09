require 'bike'

# describing functionality of class Bike
describe Bike do
	
	let(:bike){Bike.new}
	

	# feature that we expect (behaviour)
	it "should not be broken after we create it" do
		expect(bike).not_to be_broken
	end


	it "should be able to break" do # change to can
		bike.break!		# call method on bike object, 
		expect(bike).to be_broken
	end


	it "should be able to get fixed" do
		bike.break!
		bike.fix!
		expect(bike).not_to be_broken 
	end
	
	
end