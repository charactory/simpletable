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

	def initialize(args)
		@args = args
		@num_rows = 1
		@width = []
		@headings = []
		@args.each_pair do |key,value|
			@headings << key
			#@width << key.length + value
			value.each_pair do |k, v|
				@width << k.length + v
			end

		end
		

		#@args.each_key {|x| headings << x }

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
		puts @headings.join(" ")
	end

end



table = SimpleTable.new(["Six", 6], ["Twelve", 12], ["Hello there stranger", 2])
table2 = SimpleTable.new(["Six", 6], ["Hello there stranger", 2], ["Twelve", 12])
table3 = SimpleTable.new("Hello there stranger" => 2, "Twelve" => 12, "Six" => 6)
table.construct
table.draw
table2.construct
table2.draw
table3.construct
table3.draw
