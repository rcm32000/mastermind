require './lib/strings'
require 'pry'

class MasterMind
  include Strings
  attr_reader :answer
  def initialize
    @start_time  = nil
    @stop_time   = nil
  end

  def welcome_game
    @answer = possibles
    welcome_txt
    until user_input? == true
    user_input(gets.chomp.downcase)
    puts "Please choose (p)lay, (i)nstructions, or (q)uit.\n>"
    end
  end

  def possibles
    colors = ['b','g','r','y']
    answer = []
    4.times do
      answer << colors.sample
    end
    answer
  end

  def start_game
    start_txt
    game_started = true
    @start_time = Time.now
    guess_count = 0
    until game_started == false
      input = user_input(gets.chomp.downcase)
      guess_count += 1 if valid_guess?(input) == true
      if input.chars == @answer
        @stop_time = Time.now
        win_txt(guess_count, total_time)
        input
        @answer = possibles
        guess_count = 0
      elsif valid_guess?(input)
        element = correct_element_count(input)
        position = correct_position_count(input)
        # binding.pry
        guess_txt(input, element, position, guess_count)
      elsif input == '='
        puts "MASTER!...The correct answer is #{@answer.join.upcase}!\n>"
      elsif input == '`' || '~' then cheat_txt
        puts "\nYou gave up after ONLY #{guess_count}...you suck.\nI'm "\
        "kicking you back to start...have fun...you hack.\n\n"
        game_started == false
        welcome_game
      else
        puts "Please keep your guesses to\nthe first letter of each of the "\
        "four colors: Blue, Green, Red, and Yellow.\nYour guess must be "\
        "a length of four characters.\n>"
      end
    end
  end

  def user_input(input)
    case input
    when 'p' || 'play' then start_game
    when 'q'|| 'quit' then quit_game.abort
    when 'i' ||'instructions' then info
    end
    input
  end

  def user_input?
    true == 'p' || 'play' || 'i' || 'instructions' || 'q' || 'quit'
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

  def info
    info_txt
    user_input(gets.chomp.downcase)
  end

  def quit_game
    quit_txt
    abort
  end

  def win_game
    win_txt(guess_count, total_time)
    win_input = gets.chomp
    until %w[q quit].include?(win_input)
      if %w[p play].include?(win_input)
        start_game
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
  end
end
