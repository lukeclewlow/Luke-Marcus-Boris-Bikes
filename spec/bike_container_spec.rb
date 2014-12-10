require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}

	#helper method
	def fill_holder(holder)
		10.times { holder.dock(bike) }
	end
	
	it "should accept a bike" do
			
			expect(holder.bike_count).to eq(0)
			
			holder.dock(bike)
			
			expect(holder.bike_count).to eq(1)
		end

		it "should release a bike" do
			holder.dock(bike) #process bike is docked, bike count = 1
			holder.release(bike) # process bike is released, bike count -1
			expect(holder.bike_count).to eq(0) # no more bikes!
		end

		it "should know when its full" do
			expect(holder).not_to be_full #station not to be full to begin with
			fill_holder holder#When 20 added
			expect(holder).to be_full #expect station to be full up
		end


		it "should not accept a bike if its full" do
			fill_holder holder
			expect(lambda{holder.dock(bike)}).to raise_error(RuntimeError, 'Station is full') #problem
		end

		it "should provide a list of available bikes" do
			working_bike, broken_bike = Bike.new, Bike.new
			broken_bike.break!
			holder.dock(working_bike)
			holder.dock(broken_bike)
			expect(holder.available_bikes).to eq([working_bike])
		end

end
