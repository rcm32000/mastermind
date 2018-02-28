require './lib/strings'
require './lib/answer'
require 'pry'

class MasterMind < Answer
  include Strings
  attr_accessor :answer, :input
  def initialize(*)
    @start_time  = nil
    @stop_time   = nil
    @input       = nil
    @guesses     = []
  end

  def welcome_game
    welcome_txt
    until user_input? == true
      evaluate_user_input(gets.chomp.downcase)
      puts "Please choose (P)lay, (I)nstructions, or (Q)uit.\n>"
    end
  end

  def choose_level
    level_choice_txt
    until user_input? == true
      user_choose_level(gets.chomp.downcase)
      puts 'Please choose (b)eginner, i(n)termediate, (a)dvanced or (e)xtreme.'\
      "\n>"
    end
  end

  def user_choose_level(input)
    @guesses = []
    case input
    when 'q', 'quit' then quit_game.abort
    when 'i', 'instructions' then play_info
    when 'b', 'beginner' then beginner_game
    when 'n', 'intermediate' then intermediate_game
    when 'a', 'advanced' then advanced_game
    when 'e', 'extreme' then extreme_game
    end
    input
  end

  def beginner_game
    @start_time = Time.now
    @answer = beginner_possibles
    beginner_start_txt
    beginner_play_game_loop
  end

  def intermediate_game
    @start_time = Time.now
    @answer = intermediate_possibles
    intermediate_start_txt
    intermediate_play_game_loop
  end

  def advanced_game
    @start_time = Time.now
    @answer = advanced_possibles
    advanced_start_txt
    advanced_play_game_loop
  end

  def extreme_game
    @start_time = Time.now
    @answer = extreme_possibles
    extreme_start_txt
    extreme_play_game_loop
  end

  def evaluate_user_input(input)
    case input
    when 'p', 'play' then choose_level
    when 'q', 'quit' then quit_game.abort
    when 'i', 'instructions' then start_info
    end
    input
  end

  def user_input?
    'p' || 'play' || 'i' || 'instructions' || 'q' || 'quit' || 'b' ||
      'beginner' || 'n' || 'intermediate' || 'a' || 'advanced' || 'e' ||
      'extreme'
  end

  def total_time
    time_taken = (@stop_time - @start_time).round
    minutes_taken = (time_taken / 60).to_i
    seconds_taken = time_taken - (minutes_taken * 60)
    "#{minutes_taken} minutes #{seconds_taken} seconds"
  end

  def start_info
    start_info_txt
    evaluate_user_input(gets.chomp.downcase)
  end

  def play_info
    play_info_txt
    evaluate_user_input(gets.chomp.downcase)
  end

  def quit_game
    quit_txt
    abort
  end

  def win_game(guess_count)
    win_txt(guess_count, total_time)
    win_input_loop
  end

  def extreme_win_game(guess_count)
    extreme_win_txt(guess_count, total_time)
    win_input_loop
  end

    def win_input_loop
      win_input = gets.chomp
      until win_input? == true
        evaluate_user_input(win_input)
        puts "Please choose (P)lay, (I)nstructions, or (Q)uit.\n>"
        win_input = gets.chomp.downcase
      end
    end

  def evaluate_win_input(input)
    case input
    when 'p', 'play' then choose_level
    when 'q', 'quit' then quit_game.abort
    when 'i', 'instructions' then start_info
    end
    input
  end

  def win_input?
    'p' || 'play' || 'i' || 'instructions' || 'q' || 'quit'
  end

  def beginner_play_game_loop
    game_started = true
    guess_count = 0
    while game_started
      @input = gets.chomp.downcase
      guess_count += 1 if beginner_valid_guess?(input)
      beginner_check_guess(guess_count, input)
    end
  end

  def intermediate_play_game_loop
    game_started = true
    guess_count = 0
    while game_started
      @input = gets.chomp.downcase
      guess_count += 1 if intermediate_valid_guess?(input)
      intermediate_check_guess(guess_count, input)
    end
  end

  def advanced_play_game_loop
    game_started = true
    guess_count = 0
    while game_started
      @input = gets.chomp.downcase
      guess_count += 1 if advanced_valid_guess?(input)
      advanced_check_guess(guess_count, input)
    end
  end

  def extreme_play_game_loop
    game_started = true
    guess_count = 0
    while game_started
      @input = gets.chomp
      guess_count += 1 if extreme_valid_guess?(input)
      extreme_check_guess(guess_count, input)
    end
  end

  def correct_guess(guess_count)
    @stop_time = Time.now
    win_game(guess_count)
  end

  def extreme_correct_guess(guess_count)
    @stop_time = Time.now
    extreme_win_game(guess_count)
  end

  def beginner_check_guess(guess_count, input)
    return correct_guess(guess_count) if input.chars == @answer
    return cheat_game(guess_count) if input.include?('c' || 'cheat')
    return master_cheat_txt if input == '='
    return game_loop_info_txt if input.include?('i' || 'instructions')
    return quit_game if input.include?('q' || 'quit')
    return beginner_guess_response(guess_count, input) if beginner_valid_guess?(input)
    beginner_wrong_guess unless beginner_valid_guess?(input)
  end

  def intermediate_check_guess(guess_count, input)
    return correct_guess(guess_count) if input.chars == @answer
    return cheat_game(guess_count) if input.include?('c' || 'cheat')
    return master_cheat_txt if input == '='
    return game_loop_info_txt if input.include?('i' || 'instructions')
    return quit_game if input.include?('q' || 'quit')
    return intermediate_guess_response(guess_count, input) if intermediate_valid_guess?(input)
    intermediate_wrong_guess unless intermediate_valid_guess?(input)
  end

  def advanced_check_guess(guess_count, input)
    return correct_guess(guess_count) if input.chars == @answer
    return cheat_game(guess_count) if input.include?('c' || 'cheat')
    return master_cheat_txt if input == '='
    return game_loop_info_txt if input.include?('i' || 'instructions')
    return quit_game if input.include?('q' || 'quit')
    return advanced_guess_response(guess_count, input) if advanced_valid_guess?(input)
    a_e_wrong_guess unless advanced_valid_guess?(input)
  end

  def extreme_check_guess(guess_count, input)
    return extreme_correct_guess(guess_count) if input.chars == @answer
    return extreme_cheat_game(guess_count) if input.downcase.include?('c' || 'cheat')
    return extreme_master_cheat_txt if input == '='
    return game_loop_info_txt if input.downcase.include?('i' || 'instructions')
    return quit_game if input.downcase.include?('q' || 'quit')
    return extreme_guess_response(guess_count, input) if extreme_valid_guess?(input)
    a_e_wrong_guess unless extreme_valid_guess?(input)
  end

  def cheat_game(guess_count)
    cheat_txt(guess_count)
    welcome_game
  end

  def extreme_cheat_game(guess_count)
    extreme_cheat_txt(guess_count)
    welcome_game
  end

  def beginner_guess_response(guess_count, input)
    element = correct_element_count(input)
    position = correct_position_count(input)
    beginner_guess_txt(input, element, position, guess_count)
  end

  def intermediate_guess_response(guess_count, input)
    element = correct_element_count(input)
    position = correct_position_count(input)
    intermediate_guess_txt(input, element, position, guess_count)
  end

  def advanced_guess_response(guess_count, input)
    element = correct_element_count(input)
    position = correct_position_count(input)
    advanced_guess_txt(input, element, position, guess_count)
  end

  def extreme_guess_response(guess_count, input)
    element = correct_element_count(input)
    position = correct_position_count(input)
    extreme_guess_txt(input, element, position, guess_count)
  end

  def guess_table(input)
    @input = input
    table = []
    guesses_array.each_with_index do |guess, index|
      table << ["#{index + 1}  #{guess.keys[0].upcase}\t\t"\
        "#{guess.values[0][0]}\t\t#{guess.values[0][1]}"]
    end
    table.join("\n")
  end

  def extreme_guess_table(input)
    @input = input
    table = []
    guesses_array.each_with_index do |guess, index|
      table << ["#{index + 1}  #{guess.keys[0]}\t\t"\
        "#{guess.values[0][0]}\t\t#{guess.values[0][1]}"]
    end
    table.join("\n")
  end

  def guesses_array
    elements = correct_element_count(input)
    positions = correct_position_count(input)
    @guesses << { @input => [elements, positions] }
  end

  def beginner_wrong_guess
    puts "\nKeep#{wrong_guess_txt}" if @input.length == 4
    puts "\nYour guess has too many characters, you need 4, and/or keep"\
    "#{wrong_guess_txt}" if @input.length > 4
    puts "\nYour guess has too few characters, you need 4, and/or keep"\
    "#{wrong_guess_txt}" if @input.length < 4
  end

  def intermediate_wrong_guess
    puts "\nKeep#{wrong_guess_txt}" if @input.length == 6
    puts "\nYour guess has too many characters, you need 6, and/or keep"\
    "#{wrong_guess_txt}" if @input.length > 6
    puts "\nYour guess has too few characters, you need 6, and/or keep"\
    "#{wrong_guess_txt}" if @input.length < 6
  end

  def a_e_wrong_guess
    puts "\nKeep#{wrong_guess_txt}" if @input.length == 8
    puts "\nYour guess has too many characters, you need 8, and/or keep"\
    "#{wrong_guess_txt}" if @input.length > 8
    puts "\nYour guess has too few characters, you need 8, and/or keep"\
    "#{wrong_guess_txt}" if @input.length < 8
  end
end
