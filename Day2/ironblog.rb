require "date"

class Blog
	def initialize
		@container = []
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
	def split_by_page
		sort_posts.each_with_index {|post, index|
			if index/3 == 0
				puts post.title
			end
		}
		
	end
	

	def publish_front_page
		sort_posts.each do |post|
			puts post.title
			puts "*************"
			puts post.text
			puts "Posted on #{post.date}"
		end
	end
	def number_of_pages
		@container.size%3 + 1
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
post3 = Sponsored.new("Happy Post", Date.new(2015,10,12), "Hello there")
post4 = Sponsored.new("Happy Post2", Date.new(2015,10,16), "Hello there")


blog.add_post(post1)
blog.add_post(post2)
blog.add_post(post3)
blog.add_post(post4)

#blog.publish_front_page
#puts 6/3
blog.split_by_page
