# make exits an objcet

class Room 
	attr_reader :name, :description, :exits
	def initialize(name, description, exits, objects = nil)
		@name = name
		@description = description
		@exits = exits
	end
end

room1 = Room.new("r1", "You are in a dark room there is a door at the north", ["N"])
room2 = Room.new("r2", "You are in a dark room there is a door at the south", ["S"])

world = [room1, room2]

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
		if @current_room == @world[0]
			@current_room = @world[1]
		elsif @current_room == @world[1]
			@current_room = @world[0]
		end 	
	end
	def command
		command = gets.chomp
	end
	def action
		puts @current_room.description
		puts ">"
		process(command)
		action
	end

	def process(command)
		@current_room.exits.each do |exit|
			if exit == command
				change_room
			else 
				puts "There is no door in that direction"
			end
		end
	end
end

action1 = Action.new(world)
action1.action


#rooms[@currentposition]


#puts world[0]
#puts world[0].description