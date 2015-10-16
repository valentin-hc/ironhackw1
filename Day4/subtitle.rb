require 'pry'
# open file subtitle

class Subtitle
	def initialize(file_name, add)
		@data = []
		@file_name = file_name
		@add = add
	end
	
	def read_file
		lines = IO.read(@file_name)
		a = lines.split("\n\n")
				
		sub_array = a.each do |entry|
			aux = entry.split("\n")
			hash = {}
			hash[:name] = aux[0]
			hash[:date] = aux[1]
			hash[:text] = aux[2..(aux.size)]
			@data << hash						
		end
		
	end
	def change_date()
		dates = []
		@data.each do |entry|
			
			dates = entry[:date].split(" --> ")
			dates[0] = add_milisecons(dates[0])
			dates[1] = add_milisecons(dates[1])
			str = "#{dates[0]} --> #{dates[1]}"
			entry[:date] = str
		end
		
	
	end
	def add_milisecons(date)
		a=[1, 1000, 60000, 3600000]*2
		b = date.split(/[:\.,]/).map{|time| time.to_i*a.pop}.inject(&:+)
		ms = b + @add
		t = "%02d" % (ms / a[3]).to_s << ":" << 
	    	"%02d" % (ms % a[3] / a[2]).to_s << ":" << 
			"%02d" % (ms % a[2] / a[1]).to_s << "." << 
			"%03d" % (ms % a[1]).to_s
		t
	end
	
	def write_to_file
		str = ""
		@data.each do |entry|
			str += "#{entry[:name]}\n#{entry[:date]}\n"
			str += entry[:text].join("\n")
			str +="\n\n"
		end
		IO.write(@file_name, str)
	end
	
end

str = Subtitle.new('subtitle.srt', 2500)
str.read_file
str.change_date
str.write_to_file
