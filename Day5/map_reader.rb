require "pry"
require "./chessgrid"
require "./chess_piece"

class MapReader
	attr_reader :mapgrid
	def initialize
		@mapgrid = MapCreator.new.boardmap_grid_together
	end
	def pieces_on_map
		new_map = []
		@mapgrid.each do |piece|
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
end

test = MapReader.new
#puts test.startmap[0][0]
#binding.pry
print test.mapgrid
#binding.pry
#test.check_move_valid([1,2],[1,3])
#test.check_moves([[1,2],[1,2],[1,2],[1,7],[1,7],[1,7],[1,7],[2,8],[2,8],[2,8],[5,2],[5,3]], [[1,3],[1,4],[1,5],[1,6],[1,5],[1,4],[2,6],[1,6],[3,6],[4,7],[5,3],[5,2]])
#puts test.pieces_on_map[35]
