# frozen_string_literal: true

class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.player = Player.first
    if @game.save
      flash[:success] = "Game was added successfully!"
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  private

    def game_params
      params.require(:game).permit(:name, :description)
    end
end
