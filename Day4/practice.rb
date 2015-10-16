class User
	attr_reader :name :password
	def initialize
		@name = "Bob"
		@password = "1234"
	end
end

class Command
	def initilize(name, password)
		@name = name
		@password = password
	end
	def login 
		puts "Put your login and password"
		user = gets.chomp
		pwd = gets.chomp
		if user == @name
			if pwd == password
				puts "Logged in successfully"
			end
		end
	end
end

class Count
	def initialize(text)
		@text = text
	end
	def count
		words = @text.split(" ")
		words.size
	end
end

user1 = User.new
command = Command.new(user1.name, user1.password)
command.login
