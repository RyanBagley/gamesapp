require 'test_helper'

class PlayersEditTest < ActionDispatch::IntegrationTest
  def setup
    @player = Player.create!(playername: "ryan", email: "ryan@example.com",
                            password: "password", password_confirmation: "password")
  end

  test "reject an invalid edit" do
    get edit_player_path(@player)
    assert_template 'players/edit'
    patch player_path(@player), params: { player: { playername: " ", email: "ryan@example.com"} }
    assert_template 'players/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "accept valid edit" do
    get edit_player_path(@player)
    assert_template 'players/edit'
    patch player_path(@player), params: { player: { playername: "ryan1", email: "ryan1@example.com"} }
    assert_redirected_to @player
    assert_not flash.empty?
    @player.reload
    assert_match "ryan1", @player.playername
    assert_match "ryan1@example.com", @player.email
  end
end
