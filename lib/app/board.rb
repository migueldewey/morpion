require "pry"

require_relative "boardcase"
require_relative "player"

class Board
	attr_accessor :cases, :count_turn 

	def initialize
		@cases = []
		@count_turn = 0
		for i in 0..8
			@cases[i] = BoardCase.new(i)
		end
	end

	def play_turn(player)
		loop do
			puts "#{player.name} quelle case veux-tu cocher ?"
			option = gets.chomp.to_i
			if option >= 0 && option < 9 
				if  @cases[option].contenu == nil
					@cases[option].contenu = player.symbol
					@count_turn = @count_turn + 1
					break
				else
					puts "La case est déjà occupée"
				end
			else
				puts "Mouvement non valide"
			end 
		end
	end
	def victory?
		if @count_turn >= 5 && @cases[4].contenu != nil
			if    @cases[0].contenu == @cases[1].contenu && @cases[1].contenu == @cases[2].contenu # top_row 
				return true 
			elsif @cases[3].contenu == @cases[4].contenu && @cases[4].contenu == @cases[5].contenu # middle_row
				return true  
			elsif @cases[6].contenu == @cases[7].contenu && @cases[7].contenu == @cases[8].contenu # bottom_row
				return true 
			elsif @cases[0].contenu == @cases[3].contenu && @cases[3].contenu == @cases[6].contenu # left_column 
				return true 
			elsif @cases[1].contenu == @cases[4].contenu && @cases[4].contenu == @cases[7].contenu # center_column
				return true 
			elsif @cases[2].contenu == @cases[5].contenu && @cases[5].contenu == @cases[8].contenu # right_column 
				return true 
			elsif @cases[0].contenu == @cases[4].contenu && @cases[4].contenu == @cases[8].contenu # left_diagonal
				return true 
			elsif @cases[6].contenu == @cases[4].contenu && @cases[4].contenu == @cases[2].contenu # right_diagonal
				return true 
			else
				return false
			end
		else
			return false # Encore des tours
		end
	end    		
end

#binding.pry

  