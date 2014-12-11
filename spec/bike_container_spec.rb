require './lib/bike_container'
require 'byebug'
require 'bike'
class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}
	let(:van) {ContainerHolder.new}

	let(:broken_bike){double :bike, broken?: true}
	let(:working_bike){double :bike, broken?: false}

	#helper method
	def fill_holder(holder)
		10.times { holder.dock(Bike.new) } #use Bike.new as otherwise you are filling array with 10 of the same object, we want 10 different
	end

	def empty_holder(holder)				#iterates through the full array and releases one bike each time
		while !holder.eempty?
			holder.bikes.each do |bike|
				holder.release(bike)
			end
		end
	end

	# def break_all(holder)

	
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

		it "should say when there are no bikes" do			
			expect{holder.release(bike)}.to raise_error EmptyContainerError
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

		it "should know if it's empty" do
			fill_holder holder
			expect(holder).not_to be_eempty
			empty_holder holder
			expect(holder).to be_eempty
		end

		it "should collect all broken bikes" do
			holder.dock broken_bike #holder docks broken bike double
			expect{van.collect_all_broken_bikes_from holder}.to change{holder.broken_bikes.count}.by -1
			# when the van(also a holder) uses class method collect_all_broken_bikes the count where the bike was
			# docked changes by -1
		end


		it "should collect all working bikes" do 
			holder.dock working_bike
			expect{van.collect_all_working_bikes_from holder}.to change{holder.available_bikes.count}.by -1
		end
end
