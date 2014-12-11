require 'bike'
require 'garage'



describe Garage do

	let(:garage) {Garage.new}
	let(:bike) {Bike.new}

		#helper method
	def fill_garage(garage)
		10.times { garage.dock(Bike.new) }
	end

	def empty_garage(garage)
		while !garage.eempty?
			garage.bikes.each do |bike|
				garage.release(bike)
			end
		end
	end
	
	
	it "should be able to receive bikes" do
		expect(garage.bike_count).to eq(0)
		garage.dock(bike)
		expect(garage.bike_count).to eq(1)
	end

	it "should be able to release bikes" do
		garage.dock(bike)
		garage.release(bike)
		expect(garage.bike_count).to eq(0)
	end

	it "should know when its full" do
		expect(garage).not_to be_full
		fill_garage garage
		expect(garage).to be_full
	end

	it "should be able to provide a list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		garage.dock(working_bike)
		garage.dock(broken_bike)
		expect(garage.available_bikes).to eq([working_bike])
	end


	it "should be able to fix bikes" do
		bike1 = Bike.new
		bike2 = Bike.new
		bike1.break!
		bike2.break!
		garage.dock(bike1)
		garage.dock(bike2)
		garage.fix_all_broken_bikes
		expect(garage.available_bikes).to eq([bike1, bike2])
	end

it "should know if it's empty" do
			fill_garage garage
			expect(garage).not_to be_eempty
			empty_garage garage
			expect(garage).to be_eempty
		end

end