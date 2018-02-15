require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/commands'
require './lib/strings'

class TestCommands < Minitest::Test

  def test_class_exists
  command = Commands.new

  assert_instance_of Commands, command
  end

  def test_play
    string = Strings.new
    command = Commands.new
binding.pry
    assert_equal string.start_txt, command.p
  end
end
