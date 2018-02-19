require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/core'

class TestMasterMind < MiniTest::Test
  def test_class_exists
    game = MasterMind.new
    assert_instance_of MasterMind, game
  end
end
