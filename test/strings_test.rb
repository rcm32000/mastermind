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

    assert string.welcome.end_with?("(q)uit?")
  end

  def test_welcome_text
    string = Strings.new
    
    assert string.welcome.end_with?("(q)uit?")
  end

end
