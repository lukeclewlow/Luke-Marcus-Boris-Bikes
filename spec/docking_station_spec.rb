require 'bike'
require 'docking_station'

describe DockingStation do 

	let(:bike){Bike.new}
	let(:station){DockingStation.new}


	it "should accept a bike" do
		#we expect the station to have 0 bikes
		expect(station.bike_count).to eq(0)
		#lets dock a bike in the station
		station.dock(bike)
		#now we expect station to have 1 bike
		expect(station.bike_count).to eq(1)
	end

it "should release a bike" do
	station.dock(bike) #process bike is docked, bike count = 1
	station.release(bike) # process bike is released, bike count -1
	expect(station.bike_count).to eq(0) # no more bikes!
end

end