require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/strings'

class TestStrings < Minitest::Test

  def test_class_exists
    string = Strings.new
  end

  def test_welcome_text
    string = Strings.new

    assert string.welcome_txt.end_with?("(q)uit?\n>")
  end

  def test_start_text
    string = Strings.new
    assert string.start_txt.end_with?("guess?")
  end

end
