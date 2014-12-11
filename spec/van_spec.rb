
require 'van'

describe Van do
	
	let(:bike) {Bike.new}
	let(:garage) {Garage.new}
	let(:van) {Van.new}

	def fill_van(van)
		10.times { van.dock(Bike.new) }
	end

	def empty_van(van)
		while !van.eempty?
			van.bikes.each do |bike|
				van.release(bike)
			end
		end
	end
	
	it "should accept a bike" do
			
			expect(van.bike_count).to eq(0)
			
			van.dock(bike)
			
			expect(van.bike_count).to eq(1)
		end

		it "should release a bike" do
			van.dock(bike) #process bike is docked, bike count = 1
			van.release(bike) # process bike is released, bike count -1
			expect(van.bike_count).to eq(0) # no more bikes!
		end

		it "should know when its full" do
			expect(van).not_to be_full #station not to be full to begin with
			fill_van van#When 20 added
			expect(van).to be_full #expect station to be full up
		end


		it "should not accept a bike if its full" do
			fill_van van
			expect(lambda{van.dock(bike)}).to raise_error(RuntimeError, 'Station is full') #problem
		end

		it "should provide a list of available bikes" do
			working_bike, broken_bike = Bike.new, Bike.new
			broken_bike.break!
			van.dock(working_bike)
			van.dock(broken_bike)
			expect(van.available_bikes).to eq([working_bike])
		end

		it "should know if it's empty" do
			fill_van van
			expect(van).not_to be_eempty
			empty_van van
			expect(van).to be_eempty
		end

end