require 'test_helper'

class GamesEditTest < ActionDispatch::IntegrationTest
  def setup
    @player = Player.create!(playername: "ryan", email: "ryan@example.com")
    @game = Game.create(name: "Fortnite", description: "Great battle royale game", player: @player)
  end

  test "reject invalid game update" do
    get edit_game_path(@game)
    assert_template 'games/edit'
    patch game_path(@game), params: { game: { name: " ", description: "some descriptoion" } }
    assert_template 'games/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "successfully edit a game" do
    get edit_game_path(@game)
    assert_template 'games/edit'
    updated_name = "updated game name"
    updated_description = "updated description"
    path game_path(@game), params: { game: { name: updated_name, description: updated_description } }
    assert_redirected_to @game
    assert_not flash.empty?
    @game.reload
    assert_match updated_name, @game.name
    assert_match updated_description, @game.description
  end
end
