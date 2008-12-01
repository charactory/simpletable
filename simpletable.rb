#!/usr/bin/env ruby
#
#	 A port of the perl-text-simpletable library, just for learning
#
#  .-------+------------.
#	 | Foo   | Bar        |
#	 +-------+------------+
#	 | foob- | yadayaday- |
#  | arbaz | ada        |
#  | barb- | yada       |
#  | arba- |            |
#  | rbar- |            |
#  | bar   |            |
#  '-------+------------'
#  
#  eg. table = SimpleTable.new :Foo => 5, :Bar: => 10
#  table.row("fababa", "ysyaysy")
#  table.draw
#


class SimpleTable

	def initialize
		@num_rows = 1
		@width = []
		@headings = []

		@total_width = 0

	end
	
	def title(title, extra_width)
		@width << title.length + extra_width
		@headings << [title, extra_width]

		@line = ["."]
		@width.each do |x|
			@line << "+" if @line.size > 1
			x.times {|y| @line << "-"}
		end
		@line << "."

		@words = []

		#draw the line for each heading
		@headings.each do |head|
		  @words << "|" << " " << head[0]
			(head[1]-1).times {|x| @words << " "}
		end
		@words << "|"

		#how wide is everything?
		@total_width += title.length + extra_width

	end

	def construct
		@line = []
		@line << "."
		@width.each do |x|
			@line << "+" if @line.size > 1
			x.times {|y| @line << "-"}
		end
		@line << "."

		@words = []
		@args.each_pair do |key,value|
		  @words << "|" << " " << key
			(value-1).times {|x| @words << " "}
		end
		@words << "|"


	end

	def draw
		puts @line.join
		puts @words.join
		puts @line.join
		puts @total_width
	end

end

#Instead of that...
#table = SimpleTable.new
#table.heading(Six, 6)
#table.heading(Twelve, 12)
#table.heading("Hello there", 2)

table = SimpleTable.new
table.title("Two", 15)
table.title("The Black Knight", 5)
table.title("A", 1)
table.draw
