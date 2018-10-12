class PlayersController < ApplicationController


  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = "Welcome #{@player.playername} to Games Central!"
      redirect_to player_path(@player)
    else
      render 'new'
    end
  end

  def show

  end

  private

  def player_params
    params.require(:player).permit(:playername, :email, :password, :password_confirmation)
  end
end