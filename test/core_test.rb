require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/core'

class TestMasterMind < MiniTest::Test
  def test_class_exists
    game = MasterMind.new
    assert_instance_of MasterMind, game
  end

  def test_bgry_is_a_guess
    game = MasterMind.new
    @answer = ['B','G','R','Y']

    assert game.answer.include?('B')
    assert game.answer.include?('G')
    assert game.answer.include?('R')
    assert game.answer.include?('Y')
  end

  def test_answer_length
    game = MasterMind.new
    @answer = ['b','g','r','y']
    assert game.answer.length == 4
  end

  def test_guess_against_answer_colors_1
    game = MasterMind.new
    @answer = ['B','G','R','Y']
    guess = 'BGRY'
    assert_equal 4, game.correct_element_count(guess)
  end

  def test_guess_against_answer_colors_2
    game = MasterMind.new
    @answer = ['B','B','Y','Y']
    guess = 'BGRG'
    assert_equal 1, game.correct_element_count(guess)
  end

  def test_guess_against_answer_colors_3
    game = MasterMind.new
    @answer = ['B','B','R','Y']
    guess = 'YGRB'
    assert_equal 3, game.correct_element_count(guess)
  end

  def test_guess_against_answer_colors_4
    game = MasterMind.new
    @answer = ['R','G','B','B']
    guess = 'RGBY'
    assert_equal 3, game.correct_element_count(guess)
  end

  def test_guess_against_answer_position
    game = MasterMind.new
    @answer = ['B','G','R','Y']
    guess = 'BGYR'
    assert_equal 2, game.correct_position_count(guess)
  end
end
