require "date"
require "colorize"

class Blog
	attr_accessor :first_page
	def initialize
		@container = []
		@first_page = 0
	end
	def add_post(post)
		@container << post
	end
	def sort_posts
		sorted = @container.sort do |a, b|
			a.date <=> b.date
		end
		sorted
	end
	def three_posts
		a = 0
		b = 2
	end
	def show_three_posts
		start = @first_page
		stop = @first_page + 2
		sort_posts[start..stop].each_with_index {|post, index|
			puts post.title
			puts "*************"
			puts post.text
			#puts "Posted on #{post.date}"
		}
		next_page
	end
	def next_page
		puts "(next, prev)"
		paginate
		go_next = gets.chomp
		if go_next == "next" && current_page < number_of_pages
			@first_page +=3
			show_three_posts
		elsif go_next == "prev" && @first_page > 0
			@first_page -=3
			show_three_posts
		else
			puts "Let's stay here."
		end
	end
	
	def current_page 
		@first_page/3 + 1
	end
	def number_of_pages
		number = (@container.size/3.0).ceil
	end
	def paginate
		last_page = number_of_pages
		pages = (1..last_page).to_a
		pages.each do |page|
			if page == current_page
				print " #{page} ".green
			else
				print " #{page} "
			end
		end
	end
end

class Post
	attr_reader :title, :date, :text
	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text
	end
end

class Sponsored < Post
	def initialize (title, date, text)
		super("**(^_^)**#{title}**(^_^)**", date, text)
	end
	#other way to do it
	#def title
	#   "***#{super}****"
	#end
end



blog = Blog.new
post1 = Post.new("Post title 1", Date.new(2015,10,10), "Hello there")
post2 = Post.new("Post title 2", Date.new(2015,10,15), "Hello there")
post3 = Sponsored.new("Post title 3", Date.new(2015,10,12), "Hello there")
post4 = Sponsored.new("Post title 4", Date.new(2015,10,17), "Hello there")
post5 = Sponsored.new("Post title 5", Date.new(2015,10,18), "Hello there")
post6 = Sponsored.new("Post title 6", Date.new(2015,10,13), "Hello there")
post7 = Sponsored.new("Post title 7", Date.new(2015,10,11), "Hello there")

blog.add_post(post1)
blog.add_post(post2)
blog.add_post(post3)
blog.add_post(post4)
blog.add_post(post5)
blog.add_post(post6)
blog.add_post(post7)



#use /3.0  and then seiling and floor
#blog.publish_front_page
#puts 6/3
#puts blog.first_page/3
blog.show_three_posts
#blog.next_page
