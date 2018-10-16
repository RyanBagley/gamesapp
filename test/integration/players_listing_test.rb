require 'test_helper'

class PlayersListingTest < ActionDispatch::IntegrationTest
  def setup
    @player = Player.create!(playername: "ryan", email: "ryan@example.com",
                                                              password: "password", password_confirmation: "password")
    @player2 = Player.create!(playername: "john", email: "john@example.com",
                                                              password: "password", password_confirmation: "password")
  end

  test "should get players listing" do
    get players_path
    assert_template 'players/index'
    assert_select "a[href=?]", player_path(@player), text: @player.playername.capitalize
    assert_select "a[href=?]", player_path(@player2), text: @player2.playername.capitalize
  end

  test "should delete player" do
    get players_path
    assert_template 'players/index'
    assert_difference 'Player.count', -1 do
      delete player_path(@player2)
    end
    assert_redirected_to players_path
    assert_not flash.empty?
  end

end
