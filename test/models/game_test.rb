require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @game = Game.new(name: "Call of Duty", description: "great first-person shooter")
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