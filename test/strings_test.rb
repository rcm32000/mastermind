require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/strings'

class TestStrings < Minitest::Test
  def setup
    @string = Strings.new
  end

  def test_class_exists
    assert_instance_of Strings, @string
  end

  def test_welcome_text
    assert @string.welcome_txt.end_with?("(q)uit?\n>")
  end

  def test_start_text
    assert @string.start_txt.end_with?("guess?\n")
  end
end
