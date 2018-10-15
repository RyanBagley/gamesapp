require 'test_helper'

class PlayersShowTest < ActionDispatch::IntegrationTest
  def setup
    @player = Player.create!(playername: "ryan", email: "ryan@example.com",
                            password: "password", password_confirmation: "password")
    @game = Game.create(name: "Fortnite", description: "Great battle royale game", player: @player)
    @game2 = @player.games.build(name: "Fifa", description: "Great football game")
    @game2.save
  end

  test "should get players show" do
    get player_path(@player)
    assert_template 'players/show'
    assert_select "a[href=?]", game_path(@game), text: @game.name
    assert_select "a[href=?]", game_path(@game2), text: @game2.name
    assert_match @game.description, response.body
    assert_match @game2.description, response.body
    assert_match @player.playername, response.body
  end
end
