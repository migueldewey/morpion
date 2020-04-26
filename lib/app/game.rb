require "pry"
 require_relative "player"
 require_relative "board"
 require_relative "../views/show"

class Game
  attr_accessor :current_player, :status, :board, :players 
  #le current_player (égal à un objet Player), 
  #le status (en cours, nul ou un objet Player s'il gagne), 

  def initialize(name1,name2)
  	@players = []
  	@players[0] = Player.new(name1,"X")
  	@players[1] = Player.new(name2, "O")
  	@board = Board.new 
  	@status = "En cours"
  	@current_player = @players[0]
  end

  def turn
  	view = Show.new
  	view.board = @board 
  	view.show_board(@board)
  	@board.play_turn(@current_player)
  	if @board.victory?
  		@status = @current_player 
  	elsif @current_player == @players[0]
  		@current_player = @players[1]
  	elsif @current_player == @players[1]	
  		@current_player = @players[0]
  	else
  		@status = nil 
  	end
  end

  def new_round
  	@board = Board.new
  end

  def game_end
  	puts "Fin de la partie"
  	view = Show.new
  	view.board = @board
  	view.show_board(@board)
    if @status != nil
    	puts "#{@status.name} a gagné !"
    else
    	puts "Match nul"
    end
  end    
end
#binding.pry