require 'pry'
class Answer
  attr_reader :answer

  def initialize(answer=nil)
    @answer = answer
  end

  def beginner_possibles
    colors = ['b','g','r','y']
    answer = []
    4.times do
      answer << colors.sample
    end
    answer
  end

  def intermediate_possibles
    colors = ['b','g','r','y','p']
    answer = []
    6.times do
      answer << colors.sample
    end
    answer
  end

  def advanced_possibles
    colors = ['b','g','r','y','p','c']
    answer = []
    8.times do
      answer << colors.sample
    end
    answer
  end

  def extreme_possibles
    colors = ['b','g','r','y','p','c','B','G','R','Y','P','C']
    answer = []
    8.times do
      answer << colors.sample
    end
    answer
  end

    def correct_element_count(guess)
      element_count = 0
      correct_array = @answer.dup
      guess.chars.each do |check|
        correct_array.each_with_index do |char, index|
          if check == char
            correct_array[index] = nil
            element_count += 1
            break
          end
        end
      end
      element_count
    end

    def correct_position_count(guess)
      position_count = 0
      guess.chars.each_with_index do |item, index|
        position_count += 1 if @answer[index] == item
      end
      position_count
    end

    def beginner_valid_guess?(input)
      input.length == 4 && input.chars - %w[b g r y] == []
    end

    def intermediate_valid_guess?(input)
      input.length == 6 && input.chars - %w[b g r y p] == []
    end

    def advanced_valid_guess?(input)
      input.length == 8 && input.chars - %w[b g r y p c] == []
    end

    def extreme_valid_guess?(input)
      input.length == 8 && input.chars - %w[b g r y p c B G R Y P C] == []
    end
end
