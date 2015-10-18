require "pry"
require "./chessgrid"


class Piece
	attr_accessor :name, :position, :mapgrid
	def initialize(name, position)
		@name = name
		@position = position
		@board = Board.new
		@mapgrid = MapCreator.new.boardmap_grid_together
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
	def valid_and_start_not_nil?(new_pos)
		@name != nil && change_pos_valid?(new_pos) && new_pos != @position
	end
	def new_pos_free?(new_pos)
		@mapgrid.each do |piece|
			if new_pos == piece[:position]
				if piece[:name] == nil
					return true
				else
					return false
				end
			end
		end
	end
	def get_name(position)
		@mapgrid.each do |piece|
			if position == piece[:position]
				piece[:name]
			end
		end
	end
	def is_friend?(new_pos)
		get_name(@position)[0] == get_name(new_pos)[0]
	end
	def going_up?(new_pos)
		@position[1] < new_pos[1]
	end
	def going_down?(new_pos)
		@position[1] > new_pos[1]
	end
	def going_right?(new_pos)
		@position[0] < new_pos[0]
	end
	def going_left?(new_pos)
		@position[0] > new_pos[0]
	end

end

class Rook < Piece
	def same_position?(new_pos)
		@position[0] == new_pos[0] || @position[1] == new_pos[1]
	end

	def path_free(new_pos)
		if going_right?(new_pos)
			next_free_right(new_pos)
		elsif going_left?(new_pos)
			next_free_left(new_pos)
		elsif going_up?(new_pos)
			next_free_up(new_pos)
		else going_down?(new_pos)
			next_free_down(new_pos)
		end
	end
	
	def next_free_right(new_pos)
		track = 0
		a = @position[0]
		while a < new_pos[0]
			a += 1
			temp = [a, new_pos[1]]
			unless new_pos_free?(temp) && !isfriend?(temp)
				track += 1	
			end
		end
		track == 0
	end
	def next_free_left(new_pos)
		track = 0
		a = @position[0]
		while a > new_pos[0]
			a -= 1
			temp = [a, new_pos[1]]
			unless new_pos_free?(temp) && !isfriend?(temp)
				track += 1	
			end
		end
		track == 0
	end
	def next_free_up(new_pos)
		track = 0
		a = @position[1]
		while a < new_pos[1]
			a += 1
			temp = [new_pos[0], a]
			unless new_pos_free?(temp) && !isfriend?(temp)
				track += 1	
			end
		end
		track == 0
	end
	def next_free_down(new_pos)
		track = 0
		a = @position[1]
		while a > new_pos[1]
			a -= 1
			temp = [new_pos[0], a]
			unless new_pos_free?(temp) && !isfriend?(temp)
				track += 1	
			end
		end
		track == 0
	end


	def change_pos_valid?(new_pos)
		same_position?(new_pos) && pos_in_grid?(new_pos) && path_free(new_pos)
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
	def change_pos_valid?(new_pos)
		if same_column?(new_pos) && pos_in_grid?(new_pos)
			if first_move?
				position_increment_valid?(new_pos, 2)
			else
				position_increment_valid?(new_pos, 1)
			end
		end
	end
end

class BlackPawn < Pawn
	def position_increment_valid?(new_pos, allowance)
		remainder = @position[1] - new_pos[1]  
		remainder <= allowance && @position[1] >= new_pos[1]
	end
end

class Knight < Piece
	def pos_changes_checker?(new_pos)
		remainder_one = (@position[0] - new_pos[0]).abs
		remainder_two = (@position[1] - new_pos[1]).abs
		(remainder_one == 1 && remainder_two == 2) || (remainder_one == 2 && remainder_two == 1)
	end
	def change_pos_valid?(new_pos)
		pos_changes_checker?(new_pos) && pos_in_grid?(new_pos)
	end
end

class Bishop < Piece
	def pos_changes_checker?(new_pos)
		remainder_one = (@position[0] - new_pos[0]).abs
		remainder_two = (@position[1] - new_pos[1]).abs
		remainder_one == remainder_two
	end
	def change_pos_valid?(new_pos)
		pos_changes_checker?(new_pos) && pos_in_grid?(new_pos)
	end
end
class Queen < Bishop
	def same_position?(new_pos)
		@position[0] == new_pos[0] || @position[1] == new_pos[1]
	end
	def change_pos_valid?(new_pos)
		(pos_changes_checker?(new_pos) || same_position?(new_pos)) && pos_in_grid?(new_pos)
	end
end
class King < Piece
	def pos_changes_checker?(new_pos)
		remainder_one = (@position[0] - new_pos[0]).abs
		remainder_two = (@position[1] - new_pos[1]).abs
		(remainder_one == 1 || remainder_one == 0) && (remainder_two == 1 || remainder_two == 0)
		#binding.pry
	end
	def change_pos_valid?(new_pos)
		pos_changes_checker?(new_pos) && pos_in_grid?(new_pos)
	end
end




rooktest = Rook.new(:wR, [1,1])
#puts rooktest.is_friend?([1,2])
#puts rooktest.valid_and_start_not_nil?([1,8])
pawntest = Pawn.new(:wP, [8,2])
#puts pawntest.valid_and_start_not_nil?([8,2])
blackpawntest = BlackPawn.new(:bP,[2,7])
#blackpawntest.valid_and_start_not_nil?([2,6])
knighttest = Knight.new(:wK, [2,1])
#binding.pry
#knighttest.valid_and_start_not_nil?([1,3])
bishoptest = Bishop.new(:wB, [5,5])
#binding.pry
#bishoptest.valid_and_start_not_nil?([6,6])
queentest = Queen.new(:wQ, [4,1])
#binding.pry
#queentest.valid_and_start_not_nil?([4,8])
kingtest = King.new(:wK, [5,1])
#binding.pry
#kingtest.valid_and_start_not_nil?([5,2])