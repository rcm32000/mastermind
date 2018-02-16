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

  def test_bgry_is_a_guess
    assert answer.possible.include? 'B'
    assert answer.possible.include? 'G'
    assert answer.possible.include? 'R'
    assert answer.possible.include? 'Y'
  end

  def test_answer_length
    assert answer.answer.length == 4
  end

  def test_guess_against_answer_colors
    skip
    answer = Answer.new(['B','G','R','Y'])
    guess = 'BGRY'
    assert_equal 4, answer.element(guess)
  end

  def test_guess_against_answer_position
    answer = Answer.new(['B','G','R','Y'])
    guess = 'BGYR'
    assert_equal 2, answer.position(guess)
  end

end
