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

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:success] = "Game was updated successfully!"
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end

  def destroy
    Game.find(params[:id]).destroy
    flash[:success] = "Game deleted successfully"
    redirect_to games_path
  end

  private

    def game_params
      params.require(:game).permit(:name, :description)
    end
end
