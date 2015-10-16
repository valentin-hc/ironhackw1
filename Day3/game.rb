#think about data structure
#use objects
class Room 
	attr_reader :index, :description, :exits
	def initialize(index, description, exits, objects = nil)
		@index = index
		@description = description
		@exits = exits
	end
end

class World
	attr_reader :world
	def initialize(world)
		@world = world
	end
end



class Action
	attr_accessor :room
	def initialize(world)
		@world = world
		@current_room = world[0]
	end

	def change_room
		command = gets.chomp.upcase
		case @current_room
		when @world[@current_room.index]
			case command
			when @current_room.exits[0][0]
				@current_room = @world[@current_room.exits[0][1]]
			when @current_room.exits[1][0]
				@current_room = @world[@current_room.exits[1][1]]
			when @current_room.exits[2][0]
				@current_room = @world[@current_room.exits[2][1]]
			when @current_room.exits[3][0]
				@current_room = @world[@current_room.exits[3][1]]
			when "PICK UP FOOD"
				case @current_room 
				when @world[2]
					puts "Berries, yummy ! Much better than the dirt in previous rooms"
				else
					puts "Picking up food, this looks bad, but I'm starving"
				end
			else
				puts "Cant go there"
			end
		end
	end
	def play
		while @current_room.index != 10
			puts @current_room.description
			exit_list = []
			@current_room.exits.each do |exit|
				if exit.size > 1
					exit_list << "#{exit[0]}"
				end
			end
			puts "Exits: #{exit_list}"
			puts ">"
			change_room
		end
	end
end

room1 = Room.new(0, "You are in a dark room there is a door at the north", [["N",1],[],[],[]])
room2 = Room.new(1, "You are in a bright room there is a door at the south, another to the east", [["S",0],["E",2],[],[]])
room3 = Room.new(2, "You are in a forest there is a door at the west, and a window at the north", [["W",1], ["N",3],[],[]])
room4 = Room.new(3, "You are in a big room there is a door at the south, another at the north", [["S",2], ["N",4],[],[]])
room5 = Room.new(4, "You are in a forest there is a door at the south", [["S",3],[],[],[]])

world = [room1, room2, room3, room4, room5]

action1 = Action.new(world)
action1.play


#rooms[@currentposition]


#puts world[0]
#puts world[0].description