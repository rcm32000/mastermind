require './lib/strings'
require 'pry'

class MasterMind
  include Strings
  attr_accessor :answer
  def initialize
    @start_time  = nil
    @stop_time   = nil
  end

  def welcome_game
    @answer = possibles
    welcome_txt
    until user_input? == true
    evaluate_user_input(gets.chomp.downcase)
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
    @start_time = Time.now
    play_game_loop
  end

  def evaluate_user_input(input)
    case input
    when 'p', 'play' then start_game
    when 'q', 'quit' then quit_game.abort
    when 'i', 'instructions' then info
    end
    input
  end

  def user_input?
    'p' || 'play' || 'i' || 'instructions' || 'q' || 'quit'
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

  def valid_guess?(input)
    input.length == 4 && input.chars - %w[b g r y] == []
  end

  def info
    info_txt
    evaluate_user_input(gets.chomp.downcase)
  end

  def quit_game
    quit_txt
    abort
  end

  def win_game(guess_count)
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

  def play_game_loop
    game_started = true
    guess_count = 0
    while game_started
      input = evaluate_user_input(gets.chomp.downcase)
      guess_count += 1 if valid_guess?(input)
      if input.chars == @answer
        correct_guess(guess_count)
      elsif valid_guess?(input)
        element = correct_element_count(input)
        position = correct_position_count(input)
        guess_txt(input, element, position, guess_count)
      elsif input == '='
        puts "MASTER!...The correct answer is #{@answer.join.upcase}!\n>"
      elsif  %w[` ~].include? input then cheat_txt
        puts "\nYou gave up after ONLY #{guess_count}...you suck.\nI'm "\
        "kicking you back to start...have fun...you hack.\n\n"
        welcome_game
      else
        wrong_guess_txt
      end
    end
  end

  def correct_guess(guess_count)
    @stop_time = Time.now
    win_game(guess_count)
    @answer = possibles
    guess_count = 0
  end
end
