DEFAULT_CAPACITY = 20

options = {}

puts options


@capacity = options.fetch(:capacity, DEFAULT_CAPACITY) #this is key & value

# @capacity = 20, the value


puts @capacity