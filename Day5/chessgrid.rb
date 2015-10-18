require "pry"



class Board
	attr_reader :boardmap, :grid
	def initialize
		@boardmap = [[:bR, :bN, :bB, :bQ, :bK, :bB, :bN, :bR],
				[:bP, :bP, :bP, :bP, :bP, :bP, :bP, :bP],
				[nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil],
				[:wP, :wP, :wP, :wP, :wP, :wP, :wP, :wP],
				[:wR, :wN, :wB, :wQ, :wK, :wB, :wN, :wR]]

		@grid =[[[1,8],[2,8],[3,8],[4,8],[5,8],[6,8],[7,8],[8,8]],
				[[1,7],[2,7],[3,7],[4,7],[5,7],[6,7],[7,7],[8,7]],
				[[1,6],[2,6],[3,6],[4,6],[5,6],[6,6],[7,6],[8,6]],
				[[1,5],[2,5],[3,5],[4,5],[5,5],[6,5],[7,5],[8,5]],
				[[1,4],[2,4],[3,4],[4,4],[5,4],[6,4],[7,4],[8,4]],
				[[1,3],[2,3],[3,3],[4,3],[5,3],[6,3],[7,3],[8,3]],
				[[1,2],[2,2],[3,2],[4,2],[5,2],[6,2],[7,2],[8,2]],
				[[1,1],[2,1],[3,1],[4,1],[5,1],[6,1],[7,1],[8,1]]]
	end
end



class MapCreator
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
end


