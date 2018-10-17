class ApplicationController < ActionController::Base

  helper_method :current_player, :logged_in?

  def current_player
    @current_player ||= Player.find(session[:player_id]) if session[:player_id]
  end

  def logged_in?
    !!current_player
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perfomr that action"
      redirect_to root_path
    end
  end

end
