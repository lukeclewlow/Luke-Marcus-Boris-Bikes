# load BikeContainer
require_relative 'bike_container'

class DockingStation

  # this gives us all the methods that used to be in this class
  include BikeContainer
  def initialize(options = {})
    # self.capacity is calling the capacity=() method
    # (note the equals sign) defined in BikeContainer
    # capacity (the second argument to fetch()) is calling
    # the capacity() method in BikeContainer
    self.capacity = options.fetch(:capacity, capacity)
    # Ruby being nice capacity = is capacity= method from the module
    # options is a hash, :capacity symbol is the key, without key value method call on capacity
  end

end

