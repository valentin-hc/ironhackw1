require 'pry'

class Subtitle
	def initialize
		arr = []
		data_hash = {}
	end
	
	def read_file(file_name)
		lines = IO.read(file_name)
		a = lines.split("\n\n")
		data = []
		
		sub_array = a.each do |entry|
			aux = entry.split("\n")
			hash = {}
			hash[:name] = aux[0]
			hash[:date] = aux[1]
			hash[:text] = aux[2..(aux.size)]
			data << hash						
			binding.pry
		end
	end
	
end

str = Subtitle.new
str.read_file('subtitle.srt')

