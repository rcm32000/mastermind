require 'pry'
class Answer
  attr_reader :answer

  def initialize(answer=nil)
    @answer = answer
  end
  #
  # def possible
  #   ['B','B','B','B','G','G','G','G','R','R','R','R','Y','Y','Y','Y']
  # end
  #
  # def correct_element_count(guess)
  #   element_count = 0
  #   guess.chars.each do |comparable|
  #     if @answer.include?(comparable) then element_count += 1
  #     end
  #   end
  #   element_count
  # end
  #
  # def correct_position_count(guess)
  #   position_count = 0
  #   guess.chars.each_with_index do |item,index|
  #     if @answer[index] == item then position_count += 1
  #     end
  #   end
  #   position_count
  # end
end
