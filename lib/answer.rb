class Answer

  attr_reader :answer

  def initialize(answer=possible.sample(4))
    @answer = answer
  end

  def possible
    possible = ["B","B","B","B","G","G","G","G","R","R","R","R","Y","Y","Y","Y"]
  end

  def element(guess)
    element_count = 0
    guess.chars.each do |com|
      if @answer.include? com
        element_count +=1
      end
    end
    element_count
  end

  def position(guess)
    position_count = 0
    guess.chars.each_with_index do |item,index|
      binding.pry
      if @answer[index] == item
        position_count +=1
      end
    end
    position_count
  end

end
