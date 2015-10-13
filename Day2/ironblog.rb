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
	def show_three_posts
		sort_posts.each_with_index {|post, index|
			if index/3 == @first_page
				puts post.title
				puts "*************"
				puts post.text
				puts "Posted on #{post.date}"
			end
		}
		puts @first_page
		next_page

	end
	def next_page
		puts "(next, prev)"
		paginate
		go_next = gets.chomp
		if go_next == "next" && @first_page < number_of_page-1
			@first_page +=1
			show_three_posts
		elsif go_next == "prev" && @first_page > 0
			@first_page -=1
			show_three_posts
		else
			puts "Let's stay here."
		end
	end
	
	def current_page 
		@first_page + 1
	end
	def number_of_page
		@container.size%3 + 1
	end
	def paginate
		last_page = @container.size%number_of_page + 1
		pages = (1..last_page+1).to_a
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
post4 = Sponsored.new("Post title 4", Date.new(2015,10,16), "Hello there")


blog.add_post(post1)
blog.add_post(post2)
blog.add_post(post3)
blog.add_post(post4)


puts blog.number_of_page
#blog.publish_front_page
#puts 6/3
#puts blog.first_page/3
blog.show_three_posts
#blog.next_page
#puts blog.first_page

#posts[0..2]

