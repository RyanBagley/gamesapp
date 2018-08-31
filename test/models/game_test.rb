require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @player = Player.create!(playername: "ryan", email: "ryan.bagley99@gmail.com")
    @game = @player.games.build(name: "Fotnite", description: "Amazing battle royale game")
  end

  test "recipe without player should be invalid" do
    @game.player_id = nil
    assert_not @game.valid?
  end

  test "game should be valid" do
    assert @game.valid?
  end

  test "name should be present" do
    @game.name = " "
    assert_not @game.valid?
  end

  test "description should be present" do
    @game.description = " "
    assert_not @game.valid?
  end

  test "description shouldn't be less than 5 characters" do
    @game.description = "a" * 3
    assert_not @game.valid?
  end

  test "description shouldn't be more than 500 characters" do
    @game.description = "a" * 501
    assert_not @game.valid?
  end
end