require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/answer'

class TestCommands < Minitest::Test
  attr_reader :answer
  def setup
    @answer = Answer.new
  end

  def test_class_exists
    assert_instance_of Answer, answer
  end

  def test_guess_against_answer_colors_1
    @answer = ['B','G','R','Y']
    answer = Answer.new(@answer)
    guess = 'BGRY'
    assert_equal 4, answer.correct_element_count(guess)
  end

  def test_guess_against_answer_colors_2
    @answer = ['B','B','Y','Y']
    answer = Answer.new(@answer)
    guess = 'BGRG'
    assert_equal 1, answer.correct_element_count(guess)
  end

  def test_guess_against_answer_colors_3
    @answer = ['B','B','R','Y']
    answer = Answer.new(@answer)
    guess = 'YGRB'
    assert_equal 3, answer.correct_element_count(guess)
  end

  def test_guess_against_answer_colors_4
    @answer = ['R','G','B','B']
    answer = Answer.new(@answer)
    guess = 'RGBY'
    assert_equal 3, answer.correct_element_count(guess)
  end

  def test_guess_against_answer_position
    @answer = ['B','G','R','Y']
    answer = Answer.new(@answer)
    guess = 'BGYR'
    assert_equal 2, answer.correct_position_count(guess)
  end
end
