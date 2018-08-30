require 'test_helper'

class GamesTest < ActionDispatch::IntegrationTest

  def setup
    @player = Player.create!(playername: "ryan", email: "ryan@example.com")
    @game = Game.create(name: "Fortnite", description: "Great battle royale game", player: @player)
    @game2 = @player.games.build(name: "Fifa", description: "Great football game")
    @game2.save
  end

  test "should get games index" do
    get games_path
    assert_response :success
  end

  test "should get games listing" do
    get games_path
    assert_template 'games/index'
    assert_select "a[href=?]", game_path(@game), text: @game.name
    assert_select "a[href=?]", game_path(@game2), text: @game2.name
  end

  test "should get games show" do
    get game_path(@game)
    assert_template 'games/show'
    assert_match @game.name, response.body
    assert_match @game.description, response.body
    assert_match @player.playername, response.body

  end
end
