require "pry"
require "./chessgrid"
require "./chess_piece"

class PieceCreator
	attr_reader :startmap
	def initialize(startmap)
		@startmap = startmap
	end
end

test = PieceCreator.new(Board.new.map)

puts test.startmap[0][0]