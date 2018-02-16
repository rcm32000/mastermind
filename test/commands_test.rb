require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/commands'
require './lib/strings'

class TestCommands < Minitest::Test
  def setup
    @command = Commands.new
    @string = Strings.new
  end

  def test_class_exists
  assert_instance_of Commands, @command
  end

  def test_play
    assert_equal @string.start_txt, @command.p
  end
end
