require 'test_helper'

class GamesDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @player = Player.create!(playername: "ryan", email: "ryan@example.com")
    @game = Game.create(name: "Fortnite", description: "Great battle royale game", player: @player)
  end

  test "successfully delete a game" do
    get game_path(@game)
    assert_template 'games/show'
    assert_select 'a[href=?]', game_path(@game), text: "Delete this game"
    assert_difference 'Game.count', -1 do
      delete game_path(@game)
    end
    assert_redirected_to games_path
    assert_not flash.empty?
  end
end
