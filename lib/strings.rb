module Strings
  def welcome_txt
    puts "\nWelcome to MASTERMIND!!!\n"\
    "Would you like to (P)lay, read the (I)structions, "\
    "or (Q)uit?\n>"\
  end

  def beginner_start_txt
    puts "\nI have generated a beginner sequence with four "\
    "elements\nmade up of: (R)ed, (G)reen, (B)lue, and "\
    "(Y)ellow.\nThere are four positions to figure out.\n"\
    "Use (Q)uit at any time to end the game.\n"\
    "What's your guess? (WARNING: If you would like to cheat, type (C)heat"\
    ", but BEWARE!!!)\n>"\
  end

  def intermediate_start_txt
    puts "\nI have generated a intermediate sequence with five "\
    "elements\nmade up of: (R)ed, (G)reen, (B)lue, (Y)ellow, and "\
    "(P)urple.\nThere are six positions to figure out.\n"\
    "Use (Q)uit at any time to end the game.\n"\
    "What's your guess? (WARNING: If you would like to cheat, type (C)heat"\
    ", but BEWARE!!!)\n>"\
  end

  def advanced_start_txt
    puts "\nI have generated a advanced sequence with six "\
    "elements\nmade up of: (R)ed, (G)reen, (B)lue, (Y)ellow, (P)urple, and "\
    "(C)yan.\nThere are eight positions to figure out.\n"\
    "Use (Q)uit at any time to end the game.\n"\
    "What's your guess? (WARNING: If you would like to cheat, type (C)heat"\
    ", but BEWARE!!!)\n>"\
  end

  def extreme_start_txt
    puts "\nI have generated a extreme sequence with six "\
    "elements\nmade up of: (R)ed, (G)reen, (B)lue, (Y)ellow, (P)urple, and "\
    "(C)yan.\nThere are eight positions to figure out. Please note that "\
    "answer includes both capital and lower case letters!\n"\
    "Use (Q)uit at any time to end the game.\n"\
    "What's your guess? (WARNING: If you would like to cheat, type (C)heat"\
    ", but BEWARE!!!)\n>"\
  end

  def start_info_txt
    puts "\nMasterMind consists of colors.\nDepending on the difficulty "\
    "level, will give you colors and nubmer of slots.\nSlots will randomly "\
    "be filled with one or more of these colors.\nThe object of the game "\
    "is to figure out what color(s) are being used, and in what order.\n"\
    'You will receive feedback after each guess saying how '\
    "many elements or colors you guessed correctly,\nand how "\
    "many of them were in the correct slot.\n"\
    'As you increase in difficulty, there will more colors and more '\
    "positions.\nDo you want to (P)lay or (Q)uit?\n>"\
  end

  def play_info_txt
    puts "\nMasterMind consists of colors.\nDepending on the difficulty "\
    "level, will give you colors and nubmer of slots.\nSlots will randomly "\
    "be filled with one or more of these colors.\nThe object of the game "\
    "is to figure out what color(s) are being used, and in what order.\n"\
    'You will receive feedback after each guess saying how '\
    "many elements or colors you guessed correctly,\nand how "\
    "many of them were in the correct slot.\n"\
    'As you increase in difficulty, there will more colors and more '\
    "positions.\nChoose your level: (B)eginner, i(N)termediate, (A)dvanced, "\
    "or (E)xtreme.\n>"\
  end

  def level_choice_txt
    puts "Which level would you like to play?\n(B)eginner: 4 colors and 4 "\
    "positions\ni(N)termediate: 5 colors and 6 positions\n(A)dvanced: 6 "\
    "colors and 8 positions\n(E)xtreme: Advanced level, and uses both capital "\
    "and lower case letters\n>"
  end

  def win_txt(guess_count, total_time)
    puts "\nIt's about time you figured this out!\n\nIt only took you "\
    "#{guess_count} tries, and #{total_time} to get the right answer.\n"\
    "Pfftt!!! Do you want to try your luck again?\nYou should quit now "\
    "while you're ahead...so pick (P)lay, (I)nstructions, or (Q)uit?\n>"\
  end

  def extreme_win_txt(guess_count, total_time)
    puts "\nYou cheated! There is NO way you could figure this out "\
    "otherwise!!!\nWell I suppose congratulations are in order.\nIt somehow "\
    "took you only #{guess_count} tries, and #{total_time} to get the right "\
    "answer.\nDo you want to play again?\nYou should quit now "\
    "while you're ahead...so pick (P)lay, (I)nstructions, or (Q)uit?\n>"\
  end


  def beginner_guess_txt(user_input, element_count, position_count, guess_count)
    puts "\nYour guess of #{user_input.upcase} has #{element_count} "\
      "of the correct elements with #{position_count} in the "\
      "correct positions.\nYou've taken #{guess_count} guess.\nWhat is "\
      'your next guess? (WARNING: If you would like to cheat, type (C)heat'\
      "y, but BEWARE!!!)\n#{beginner_guesses_txt}\n>"\
  end

  def intermediate_guess_txt(user_input, element_count, position_count, guess_count)
    puts "\nYour guess of #{user_input.upcase} has #{element_count} "\
      "of the correct elements with #{position_count} in the "\
      "correct positions.\nYou've taken #{guess_count} guess.\nWhat is "\
      'your next guess? (WARNING: If you would like to cheat, type (C)heat'\
      "y, but BEWARE!!!)\n#{intermediate_guesses_txt}\n>"\
  end

  def advanced_guess_txt(user_input, element_count, position_count, guess_count)
    puts "\nYour guess of #{user_input.upcase} has #{element_count} "\
      "of the correct elements with #{position_count} in the "\
      "correct positions.\nYou've taken #{guess_count} guess.\nWhat is "\
      'your next guess? (WARNING: If you would like to cheat, type (C)heat'\
      "y, but BEWARE!!!)\n#{advanced_guesses_txt}\n>"\
  end

  def extreme_guess_txt(user_input, element_count, position_count, guess_count)
    puts "\nYour guess of #{user_input} has #{element_count} "\
      "of the correct elements with #{position_count} in the "\
      "correct positions.\nYou've taken #{guess_count} guess.\nWhat is "\
      'your next guess? (WARNING: If you would like to cheat, type (C)heat'\
      "y, but BEWARE!!!)\n#{extreme_guesses_txt}\n>"\
  end

  def quit_txt
    puts "\nLeaving so soon? Ah well...thanks for playing!!!\n\n"
  end

  def cheat_txt(guess_count)
    puts "YOU CHEATER!!! #{@answer.join.upcase} was the correct "\
    "answer!\nYou gave up after ONLY #{guess_count} guess(es)...you suck.\nI'm "\
    "kicking you back to start...have fun...hack.\n\n"
  end

  def extreme_cheat_txt(guess_count)
    puts "YOU CHEATER!!! #{@answer.join} was the correct "\
    "answer!\nYou gave up after ONLY #{guess_count} guess(es)...you suck.\nI'm "\
    "kicking you back to start...have fun...hack.\n\n"
  end

  def wrong_guess_txt
    puts " your guesses to the first letter of each of the colors.\n>"
  end

  def master_cheat_txt
    puts "MASTER!...The correct answer is #{@answer.join.upcase}!\nType it "\
    "in now to win.\n>"
  end

  def extreme_master_cheat_txt
    puts "MASTER!...The correct answer is #{@answer.join}!\nType it "\
    "in now to win.\n>"
  end

  def beginner_guesses_txt
    "Your past guesses:\n\#  Guess\tElements\tPositions\n"\
    "#{guess_table(input)}\n-----------------------------------------"
  end

  def intermediate_guesses_txt
    "Your past guesses:\n\#  Guess\tElements\tPositions\n"\
    "#{guess_table(input)}\n-------------------------------------------"
  end


  def advanced_guesses_txt
    "Your past guesses:\n\#  Guess\tElements\tPositions\n"\
    "#{guess_table(input)}\n---------------------------------------------"
  end

  def extreme_guesses_txt
    "Your past guesses:\n\#  Guess\tElements\tPositions\n"\
    "#{extreme_guess_table(input)}\n"\
    '---------------------------------------------'
  end
end
