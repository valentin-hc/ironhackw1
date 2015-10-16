require "pry"
require "./chessgrid"


class Piece
	attr_accessor :name, :position
	def initialize(name, position)
		@name = name
		@position = position
		@board = Board.new
	end
	def pos_in_grid?(position)
		tracker = 0
		@board.grid.each do |line|
			line.each do |pos|
				if pos == position
					tracker +=1
				end
			end
		end
		tracker > 0
	end
	def output(new_pos)
		if change_pos_valid(new_pos)
			puts "LEGAL"
		else
			puts "ILLEGAL"
		end
	end
end

class Rook < Piece
	def same_position?(new_pos)
		@position[0] == new_pos[0] || @position[1] == new_pos[1]
	end

	def change_pos_valid(new_pos)
		same_position?(new_pos) && pos_in_grid?(new_pos)
		#binding.pry
	end
end

class Pawn < Piece
	attr_accessor :move
	def initialize(name, position)
		super(name, position)
		@move = 0
	end
	def modify_move
		if @move == 0
			@move +=1
		end
	end
	def first_move?
		@move == 0
	end
	def same_column?(new_pos)
		@position[0] == new_pos[0]
	end
	def position_increment_valid?(new_pos, allowance)
		remainder = new_pos[1] - @position[1] 
		remainder <= allowance && new_pos[1] >= @position[1]
	end
	def change_pos_valid(new_pos)
		if same_column?(new_pos)
			if first_move?
				position_increment_valid?(new_pos, 2)
			else
				position_increment_valid?(new_pos, 1)
			end
		end
	end
end

rooktest = Rook.new(:wR, [8,1])
#puts rooktest.output([8,2])
#pawntest = Pawn.new(:wP, [8,2])
puts pawntest.output([8,2])


