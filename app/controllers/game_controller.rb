require 'json'

class TicTacToeGame
  attr_accessor :game

  def initialize(game, x, o)
    @game = game
    @x = x
    @o = o
  end

  def place(x, y, turn)
    x_or_o = " "
    if turn == @x
      x_or_o = "x"
    elsif turn == @o
      x_or_o = "o"
    end
    @game[x][y] = x_or_o
  end

  def winner
  end
end

class GameController < ApplicationController
  def index
    @id = session['id']
    user = {active: false}
    if @id
      user = User.find @id
    end
    @logged_in = (@id != nil) & user['active']

    g = Game.first
    @game = JSON.parse(g.game)
    @your_turn = g.turn_id == @id
  end

  def update
    g = Game.first
    your_turn = g.turn_id == session['id']
    game = JSON.parse(g.game)

    x = piece_params[:x].to_i
    y = piece_params[:y].to_i

    if your_turn
      tttg = TicTacToeGame.new game, g.player1_id, g.player2_id
      tttg.place x, y, g.turn_id
      g.game = JSON.generate tttg.game
      if g.turn_id == g.player1_id
        g.turn_id = g.player2_id
      elsif g.turn_id == g.player2_id
        g.turn_id = g.player1_id
      end
    end

    if g.save
      redirect_to '/game'
    end
  end

  private
    def piece_params
      {x: params.require(:x), y: params.require(:y)}
    end
end
