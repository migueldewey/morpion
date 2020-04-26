#require 'bundler'
#Bundler.require
require "pry"

require_relative "lib/app/game"
require_relative "lib/app/player"
require_relative "lib/app/board"
require_relative "lib/views/show"

class Application
  def perform
  	regles
  	puts "Entre le prénom du premier joueur :"
  	print "> "
  	name1 = gets.chomp
  	puts "Entre le prénom du deuxième joueur :"
  	print "> "
  	name2 = gets.chomp
  	game = Game.new(name1,name2)
  	still = "o"
  	while still == "o"
	  	game.new_round
	  	while !game.board.victory?
	  	game.turn
	  	end
	  	game.game_end
	  	puts "Vous voulez jouer une autre partie?"
	  	puts "o = oui, n = non"
	  	still = gets.chomp
	  	break if still == "n"
    end
  end
  def regles
  	puts "Bienvenues le tableau se divise comme suit: "
  	puts row = [" 0 " "|" " 1 " "|" " 2 "]
   	puts separator = "-----------"
   	puts row = [" 3 " "|" " 4 " "|" " 5 "]
   	puts separator
   	puts row = [" 6 " "|" " 7 " "|" " 8 "]
   	puts ""
  end
end


Application.new.perform