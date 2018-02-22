require './lib/strings'
require 'pry'

class MasterMind
  include Strings
  def initialize
    @answer      = possibles
    @start_time  = nil
    @stop_time   = nil
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
    guess_count = 0
    until game_started == false
      user_input = gets.chomp.downcase
      guess_count += 1
      if %w[q quit].include?(user_input)
        game_started = false
        quit_txt
        abort
      elsif user_input.chars == @answer
        @stop_time = Time.now
        win_txt(guess_count, total_time)
        game_started = false
        guess_count = 0
        win_input = gets.chomp
        until %w[q quit].include?(win_input)
          if %w[p play].include?(win_input)
            play_game
          elsif %w[i instructions].include?(win_input)
            info_txt
            win_input = gets.chomp.downcase
          else
            puts "Please choose (p)lay, (i)nstructions, or (q)uit.\n>"
            win_input = gets.chomp.downcase
          end
        end
        quit_txt
        abort
      elsif valid_guess?(user_input)
        element = correct_element_count(user_input)
        position = correct_position_count(user_input)
        guess_txt(user_input, element, position, guess_count)
      else
        puts "Please keep your guesses to\nthe first letter of each of the "\
        "four colors: Blue, Green, Red, and Yellow.\nYour guess must be "
        "a length of four characters.\n>"
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
    correct_array = @answer.dup
    guess.chars.each do |check|
      element_count += correct_array.find_all do |comparables|
        comparables == check
      end.length
      correct_array.delete(check)
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
