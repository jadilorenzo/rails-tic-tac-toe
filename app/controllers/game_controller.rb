require 'json'

class TicTacToeGame
  def initialize(game)
    @game = game
  end

  def place
  end

  def winner
  end
end

class GameController < ApplicationController
  def index
    g = Game.first
    @game = JSON.parse(g.game)
  end

  def update
    g = Game.first
    game = JSON.parse(g.game)
    game[piece_params[:x].to_i][piece_params[:y].to_i] = 'x'
    g.game = game
    if g.save
      redirect_to '/game'
    end
  end

  private
    def piece_params
      {x: params.require(:x), y: params.require(:y)}
    end
end
