class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Bob's place", "San Juan", 3, 44),
  Home.new("John's place", "Paris", 4, 41),
  Home.new("Tim's place", "Bilbao", 4, 40),
  Home.new("Frank's place", "Valencia", 1, 60),
  Home.new("Kevin's place", "Gibraltar", 2, 39),
  Home.new("Ariel's place", "San Juan", 3, 59),
]

def listing(homes)
	homes.each do |home|
		puts "#{home.name} in #{home.city}"
		puts "#{home.price} euros per room and per night."
		puts "Available rooms : #{home.capacity}"
	end
end

#listing(homes)


def sorted_list(homes)
	sort_low = homes.sort do |a,b|
	a.price <=> b.price
	end
	sort_high = homes.sort do |a,b|
		b.price <=> a.price
	end
	sort_capacity_low = homes.sort do |a,b|
		a.capacity <=> b.capacity
	end
	sort_capacity_high = homes.sort do |a,b|
		b.capacity <=> a.capacity
	end
	listing(sort_low)
	puts "Sort by : Price high first, Capacity high first, Capacity low first"
	answer = gets.chomp
	if answer == "Price high first"
		listing(sort_high)
	elsif answer == "Capacity high first"
		listing(sort_capacity_high)
	elsif answer == "Capacity low first"
		listing(sort_capacity_low)
	else
		puts "What was that?"
	end	
end

#sorted_list(homes)

def byCity(homes)
	puts "Where are you going ?"
	city_name = gets.chomp
	selection = homes.select do |hm|
	  hm.city == city_name
	end
	selection
end

#puts byCity(homes)


def averagePrice(homes)
	total_price = homes.reduce(0.0) do |sum, hm|
		sum + hm.price
	end
	total_price/homes.length
end


def myPrice(homes)
	myHome = []
	puts "What price would you like to pay per night?"
	wanted_price = gets.chomp
	wanted_price_home = homes.find do |hm|
		hm.price.to_s == wanted_price
	end
	myHome << wanted_price_home
	listing(myHome)
end


myPrice(homes)




