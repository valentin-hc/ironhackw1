require "pry"
require "./chessgrid"
require "./chess_piece"

class PieceCreator
	attr_reader :startmap, :grid
	def initialize
		@startmap = Board.new.boardmap
		@grid = Board.new.grid
	end
	def boardmap_grid_together
		new_array = []
		together = @startmap.zip @grid
		together.each do |array|
			array[0].zip array[1][0]
		end
		together.each do |line|
			a = 0
			while a < 8
				hash = {}
				hash[:name] = line[0][a]
				hash[:position] = line[1][a]
				new_array << hash
				a +=1
			end
		end
		new_array
	end
	def pieces_on_map
		new_map = []
		boardmap_grid_together.each do |piece|
			case piece[:name]
			when :wP
				new_map << Pawn.new(piece[:name], piece[:position])
			when :bP
				new_map << BlackPawn.new(piece[:name], piece[:position])
			when :bR, :wR
				new_map << Rook.new(piece[:name], piece[:position])
			when :bN, :wN
				new_map << Knight.new(piece[:name], piece[:position])
			when :bB, :wB
				new_map << Bishop.new(piece[:name], piece[:position])
			when :bQ, :wQ
				new_map << Queen.new(piece[:name], piece[:position])
			when :bK, :wK
				new_map << King.new(piece[:name], piece[:position])
			when nil
				new_map << Piece.new(nil, piece[:position])
			end
		end
		new_map
	end
	def new_pos_free?(new_pos)
		pieces_on_map.each do |piece|
			if new_pos == piece.position
				piece.name == nil
			end
		end
	end

	def check_move_valid(current_pos, new_pos)
		pieces_on_map.each do |piece|
			if current_pos == piece.position
				puts "#{current_pos} to #{new_pos} #{piece.output(new_pos)}"
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

test = PieceCreator.new
#puts test.startmap[0][0]
#print test.grid[0][0]
#binding.pry
#test.check_move_valid([1,2],[1,3])
test.check_moves([[1,2],[1,2],[1,2],[1,7],[1,7],[1,7],[1,7],[2,8],[2,8],[2,8],[5,2],[5,3]], [[1,3],[1,4],[1,5],[1,6],[1,5],[1,4],[2,6],[1,6],[3,6],[4,7],[5,3],[5,2]])
#puts test.pieces_on_map[35]
