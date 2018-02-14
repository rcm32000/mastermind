require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/commands'

class TestCommands < Minitest::Test

  def test_class_exists
  command = Commands.new

  assert_instance_of Commands, command
  end

  def test_play
    command = Commands.new

    
  end
end
