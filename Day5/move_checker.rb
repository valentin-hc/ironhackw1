require "pry"
require "./chessgrid"
require "./chess_piece"
require "./map_reader"

class MoveChecker
	def initialize
		@pieces_on_map = MapReader.new.pieces_on_map
	end
	def new_pos_free?(new_pos)
		@pieces_on_map.each do |piece|
			if new_pos == piece.position
				if piece.name == nil
					return true
				else
					return false
				end
			end
		end
	end

	def check_move_valid(current_pos, new_pos)
		@pieces_on_map.each do |piece|
			if current_pos == piece.position 
				if new_pos_free?(new_pos) && piece.valid_and_start_not_nil?(new_pos)
					puts "#{current_pos} to #{new_pos} LEGAL"
				else
					puts "#{current_pos} to #{new_pos} ILLEGAL"
				end
			end 
		end
	end
	def check_moves(current_pos, new_pos)
		comparing_pos = current_pos.zip new_pos
		comparing_pos.each do |positions|
			check_move_valid(positions[0], positions[1])
		end
	end
end

test = MoveChecker.new
test.check_moves([[1,2],[1,2],[1,2],[1,7],[1,7],[1,7],[1,7],[2,8],[2,8],[2,8],[5,2],[5,3],[1,1]], [[1,3],[1,4],[1,5],[1,6],[1,5],[1,4],[2,6],[1,6],[3,6],[4,7],[5,3],[5,2],[3,1]])
