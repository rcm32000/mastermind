module Strings
  def welcome_txt
    puts "\nWelcome to MASTERMIND!!!\n"\
    'Would you like to (p)lay, read the (i)structions, '\
    "or (q)uit?\n>"\
  end

  def start_txt
    puts 'I have generated a beginner sequence with four '\
    'elements made up of: (r)ed, (g)reen, (b)lue, and '\
    "(y)ellow. Use (q)uit at any time to end the game.\n"\
    "What's your guess?\n>"\
  end

  def info_txt
    puts 'MasterMind consists of the colors Red, Green, Blue, '\
    'and Yellow.  Four slots will randomly be filled with '\
    'one or more of these colors.  The object of the game '\
    'is to figure out what color(s) are being used, and in '\
    "what order.\n"\
    'You will receive feedback after each guess saying how '\
    'many elements or colors you guesses correctly, and how '\
    "many of them were in the correct slot.\n"\
    "Would you like to (p)lay or (q)uit?\n>"\
  end

  def win_txt(guess_count, total_time)
    puts "It's about time you figured this out! It only took you "\
    "#{guess_count} tries, and #{total_time} to get the right answer. Pfftt!!!"\
    "Do you want to try your luck again? You should quit now while you're "\
    "ahead. So pick (p)lay, (i)nstructions, or (q)uit?\n>"\
  end


  def guess_txt(user_input, element_count, position_count, guess_count)
    puts "Your guess of #{user_input.upcase} has #{element_count} "\
      "of the correct elements with #{position_count} in the "\
      "correct positions.\nYou've taken #{guess_count} guess. What is "\
      "your next guess?\n>"
  end

  def quit_txt
    puts 'Leaving so soon? Ah well...thanks for playing!!!'
  end
end
