require "pry"
require_relative "../app/board"

class Show
	attr_accessor :board
	def initialize
		@board = Board.new
	end

  def show_board(board)
  	puts ""
   puts "  #{@board.cases[0].contenu} |  #{@board.cases[1].contenu} |  #{@board.cases[2].contenu} "
   puts "-------------"
   puts "  #{@board.cases[3].contenu} |  #{@board.cases[4].contenu} |  #{@board.cases[5].contenu} "
   puts "-------------"
   puts "  #{@board.cases[6].contenu} |  #{@board.cases[7].contenu} |  #{@board.cases[8].contenu} "
  	puts ""
  end

end
#binding.pry 
