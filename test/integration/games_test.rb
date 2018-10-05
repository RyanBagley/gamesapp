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

  test "create new valid game" do
    get new_game_path
    assert_template 'games/new'
    name_of_game = "Battlefield"
    description_of_game = "Online First-person shooter"
    assert_difference 'Game.count', 1 do
      post games_path, params: { game: { name: name_of_game, description: description_of_game}}
    end
    follow_redirect!
    assert_match name_of_game.capitalize, response.body
    assert_match description_of_game, response.body
  end

  test "reject invalid game submissions" do
    get new_game_path
    assert_template 'games/new'
    assert_no_difference 'Game.count' do
      post games_path, params: { game: { name: " ", description: " " } }
    end
    assert_template 'games/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end
