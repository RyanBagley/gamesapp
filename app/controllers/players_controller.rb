class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.paginate(page: params[:page], per_page: 5)
  end


  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      session[:player_id] = @player.id
      flash[:success] = "Welcome #{@player.playername} to Games Central!"
      redirect_to player_path(@player)
    else
      render 'new'
    end
  end

  def show
    @player_games = @player.games.paginate(page: params[:page], per_page: 5)
  end

  def edit

  end

  def update
    if @player.update(player_params)
      flash[:success] = "Your account was updated succesfully"
      redirect_to @player
    else
      render 'edit'
    end
  end

  def destroy
    @player.destroy
    flash[:danger] = "Player and all associated games have been deleted"
    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:playername, :email, :password, :password_confirmation)
  end

  def set_player
    @player = Player.find(params[:id])
  end
end