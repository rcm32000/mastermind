require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/answer'

class TestCommands < Minitest::Test

  def test_class_exists
  answer = Answer.new

  assert_instance_of Answer, answer
  end

end
