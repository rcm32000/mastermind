require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/strings'

class TestStrings < Minitest::Test
  include Strings
  def test_welcome_text
    skip
    assert welcome_txt.end_with?("(q)uit?\n>")
  end

  def test_game_loop_text
    skip
    assert game_loop_txt.end_with?("guess?\n")
  end
end
