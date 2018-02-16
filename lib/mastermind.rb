require './lib/strings'

class MasterMind
  include Strings
  def initialize
    @possibles = possibles
  end

  def start_game
    puts welcome_txt
    input = gets.chomp.downcase
    case input
    when %w(p play).include?(input) then start_txt
    when %w(q quit)
    end

  end

  def possibles
    arr = ['r','g','b','y']
    thing = []
    4.times do
      thing << arr.sample
    end
    thing
  end
end
