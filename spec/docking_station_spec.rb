require 'bike'
require 'docking_station'

describe DockingStation do 

	let(:bike){Bike.new}
	let(:station){DockingStation.new(:capacity => 20) }


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

it "should know when its full" do
	expect(station).not_to be_full #station not to be full to begin with
	20.times { station.dock(bike) } #When 20 added
	expect(station).to be_full #expect station to be full up
end

end