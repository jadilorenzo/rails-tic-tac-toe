require 'json'

class TicTacToeGame
  attr_accessor :game

  def initialize(game, x, o)
    @game = game
    @x = x
    @o = o
  end

  def place(x, y, turn)
    if @game[x][y] != " "
      return false
    end

    x_or_o = " "
    if turn == @x
      x_or_o = "x"
    elsif turn == @o
      x_or_o = "o"
    end
    @game[x][y] = x_or_o

    true
  end

  def winner
  end
end

class GameController < ApplicationController
  def index
    handle_header()
    @games = Game.all
  end

  def show
    handle_header()
    @game_id = params["id"]
    @g = Game.find(@game_id)
    @game = JSON.parse(@g.game)
  end

  def new
    handle_header()
    @game = Game.new
    @username = @id ? @user["username"] : "..."
  end

  def create
    handle_header()
    @game = Game.new game_params

    if @game.save
      redirect_to @game
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    game_id = params["id"]
    g = Game.find(game_id)
    your_turn = g.turn_id == session['id']
    game = JSON.parse(g.game)

    x = piece_params[:x]
    y = piece_params[:y]
    p1 = g.player1_id
    p2 = g.player2_id
    turn = g.turn_id

    if your_turn
      tttg = TicTacToeGame.new game, p1, p2

      if tttg.place x, y, turn
        g.game = JSON.generate tttg.game
        if turn == p1
          g.turn_id = p2
        elsif turn == p2
          g.turn_id = p1
        end

        if g.save
          ActionCable.server.broadcast "update", g.game
          redirect_to '/game'
        end
      else
        redirect_to '/game'
      end
    end
  end


  private
    def piece_params
      {x: params.require(:x).to_i, y: params.require(:y).to_i}
    end

    def game_params
      g = params.require(:game).permit(:name, :player1_id, :player2_id).to_h
      g[:game] = JSON.generate [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
      g[:turn_id] = g[:player1_id]
      puts g

      return g
    end

    def handle_header()
      @id = session['id']
      @user = {active: false, username: '', password: ''}
      @user = User.find @id if @id
      @logged_in = (@id != nil) & @user['active']
      if params['id']
        @your_turn = Game.find(params['id']).turn_id == session['id']
      end
    end
end
