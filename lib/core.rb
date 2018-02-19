require './lib/strings'

class MasterMind
  include Strings
  def initialize
    @answer      = possibles
    @start_time  = nil
    @stop_time   = nil
    @guess_count = 0
  end

  def start_game
    welcome_txt
    user_input = gets.chomp.downcase
    until %w[q quit].include?(user_input)
      if %w[p play].include?(user_input)
        play_game
      elsif %w[i instructions].include?(user_input)
        info_txt
        user_input = gets.chomp.downcase
      else
        puts "Please choose (p)lay, (i)nstructions, or (q)uit.\n>"
        user_input = gets.chomp.downcase
      end
    end
    quit_txt
    # require 'pry';binding.pry
  end

  def possibles
    colors = ['b','g','r','y']
    answer = []
    4.times do
      answer << colors.sample
    end
    answer
  end

  def play_game
    start_txt
    game_started = true
    @start_time = Time.now
    until game_started == false
      user_input = gets.chomp.downcase
      @guess_count += 1
      if %w[q quit].include?(user_input)
        game_started = false
        quit_txt
        abort
      elsif user_input.chars == @answer
        @stop_time = Time.now
        game_started = false
        win_txt(@guess_count, total_time)
      elsif valid_guess?(user_input)
        element = correct_element_count(user_input)
        position = correct_position_count(user_input)
        guess_txt(user_input, element, position, @guess_count)
      else
        puts 'Please keep your guesses to the first letter of each of the '\
        "four colors: Blue, Green, Red, and Yellow.\n>"
      end
    end
  end

  def total_time
    time_taken = (@stop_time - @start_time).round
    minutes_taken = (time_taken / 60).to_i
    seconds_taken = time_taken - (minutes_taken * 60)
    "#{minutes_taken} minutes #{seconds_taken} seconds"
  end

  def correct_element_count(guess)
    element_count = 0
    guess.chars.each do |comparable|
      element_count += 1 if @answer.include?(comparable)
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

  def valid_guess?(user_input)
    user_input.length == 4 && user_input.chars - %w[b g r y] == []
  end
end
