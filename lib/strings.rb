module Strings
  def welcome_txt
    puts "\e[H\e[2J"
    puts "\nWelcome to MASTERMIND!!!\n"\
    "Would you like to read the (I)nstructions, (P)lay, or (Q)uit?\n>"\
  end

  def beginner_start_txt
    puts "\e[H\e[2J"
    puts "\nI have generated a beginner sequence with four "\
    "elements that include one or more of the following:\n(B)lue, (G)reen, "\
    "(R)ed, and (Y)ellow.\nThere are four positions to figure out.\n"\
    'Use (I)nstructions to read the instructions, or (Q)uit at any time to '\
    "end the game.\nWhat's your guess? (WARNING: If you would like to cheat, "\
    "type (C)heat, but BEWARE!!!)\n>"
  end

  def intermediate_start_txt
    puts "\e[H\e[2J"
    puts "\nI have generated an intermediate sequence with five "\
    "elements that include one or more of the following:\n(B)lue, (G)reen, "\
    "(P)urple, (R)ed, and (Y)ellow.\nThere are six positions to figure "\
    "out.\nUse (I)nstructions to read the instructions, or (Q)uit at any "\
    "time to end the game.\nWhat's your guess? (WARNING: If you would like "\
    "to cheat, type (C)heat, but BEWARE!!!)\n>"
  end

  def advanced_start_txt
    puts "\e[H\e[2J"
    puts "\nI have generated an advanced sequence with six "\
    "elements that include one or more of the following:\n(B)lue, (C)yan, "\
    "(G)reen, (P)urple, (R)ed, and (Y)ellow.\nThere are eight positions to "\
    "figure out.\n\nUse (I)nstructions to read the instructions, or (Q)uit "\
    "at any time to end the game.\nWhat's your guess? (WARNING: If you would "\
    "like to cheat, type (C)heat, but BEWARE!!!)\n>"\
  end

  def extreme_start_txt
    puts "\e[H\e[2J"
    puts "\nI have generated an extreme sequence with six "\
    "elements that include one or more of the following:\n(B)lue, (C)yan, "\
    "(G)reen, (P)urple, (R)ed, and (Y)ellow.\nThere are eight positions to "\
    "figure out.\nPlease note that answer includes both capital and lower "\
    "case letters!\n\nUse (I)nstructions to read the instructions, or (Q)uit "\
    "at any time to end the game.\nWhat's your guess? (WARNING: If you would "\
    "like to cheat, type (C)heat, but BEWARE!!!)\n>"\
  end

  def start_info_txt
    puts "\e[H\e[2J"
    puts "\nMasterMind is a guessing game in which you must guess what "\
    "colors are being used\nand what order they are in.\n\nEach guess you "\
    "make will be the first letter of the color(s) you guess.\n"\
    "(ex: \"rrrr\" or \"gbry\")\n\nYou will receive feedback after each guess "\
    "telling you how many colors you guessed correctly,\nand how many of your "\
    "correct guesses were also in the right position.\n(ex: if the answer is "\
    " \"BBRY\" and you guess \"GRBY\",\nyou would have 3 correct colors "\
    "(B, R, and Y), with 1 in the correct position (Y).\n\n"\
    'As you increase in difficulty, there will be more colors and more '\
    "positions.\n\nDo you want to (P)lay or (Q)uit?\n>"\
  end

  def play_info_txt
    puts "\e[H\e[2J"
    puts "\nMasterMind is a guessing game in which you must guess what "\
    "colors are being used\nand what order they are in.\n\nEach guess you "\
    "make will be the first letter of the color(s) you guess.\n"\
    "(ex: \"rrrr\" or \"gbry\")\n\nYou will receive feedback after each guess "\
    "telling you how many colors you guessed correctly,\nand how many of your "\
    "correct guesses were also in the right position.\n(ex: if the answer is "\
    " \"BBRY\" and you guess \"GRBY\",\nyou would have 3 correct colors "\
    "(B, R, and Y), with 1 in the correct position (Y).\n\n"\
    'As you increase in difficulty, there will be more colors and more '\
    "positions.\n\nChoose your level: (B)eginner, i(N)termediate, (A)dvanced, "\
    "or (E)xtreme.\n>"\
  end

  def game_loop_info_txt
    puts "\e[H\e[2J"
    puts "\nMasterMind is a guessing game in which you must guess what "\
    "colors are being used\nand what order there are in.\n\nEach guess you "\
    "make will be the first letter of the color(s) you guess.\n"\
    "(ex: \"rrrr\" or \"gbry\")\n\nYou will receive feedback after each guess "\
    "telling you how many colors you guessed correctly,\nand how many of your "\
    "correct guesses were also in the right position.\n(ex: if the answer is "\
    " \"BBRY\" and you guess \"GRBY\",\nyou would have 3 correct colors "\
    "(B, R, and Y), with 1 in the correct position (Y).\n\n"\
    'As you increase in difficulty, there will be more colors and more '\
    "positions.\n\nWhat is your next guess?\n>"
  end

  def level_choice_txt
    puts "\e[H\e[2J"
    puts "\nWhich level would you like to play?\n(B)eginner: 4 colors and 4 "\
    "positions\ni(N)termediate: 5 colors and 6 positions\n(A)dvanced: 6 "\
    "colors and 8 positions\n(E)xtreme: Advanced level, that uses both "\
    "capital and lower case letters.\nYou can always read the (I)nstructions "\
    "or (Q)uit.\n>"
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
    puts "\e[H\e[2J"
    puts "\nYour guess of #{user_input.upcase} has #{element_count} "\
      "of the correct elements with #{position_count} in the "\
      "correct positions.\nYou've taken #{guess_count} guess(es)."\
      "\n#{guesses_txt}\nWhat is your next guess? (WARNING: If you "\
      "would like to cheat, type (C)heat,but BEWARE!!!)\nYou can always "\
      "choose to read the (I)nstructions or (Q)uit playing.\nPossible colors "\
      "are (B)lue, (G)reen, (R)ed, and (Y)ellow.\n>"\
  end

  def intermediate_guess_txt(user_input, element_count, position_count, guess_count)
    puts "\e[H\e[2J"
    puts "\nYour guess of #{user_input.upcase} has #{element_count} "\
      "of the correct elements with #{position_count} in the "\
      "correct positions.\nYou've taken #{guess_count} guess(es)."\
      "\n#{guesses_txt}\nWhat is your next guess? (WARNING: If "\
      "you would like to cheat, type (C)heat,but BEWARE!!!)\nYou can always "\
      "choose to read the (I)nstructions or (Q)uit playing.\nPossible colors "\
      "are (B)lue, (G)reen, (P)urple, (R)ed, and (Y)ellow.\n>"\
  end

  def advanced_guess_txt(user_input, element_count, position_count, guess_count)
    puts "\e[H\e[2J"
    puts "\nYour guess of #{user_input.upcase} has #{element_count} "\
      "of the correct elements with #{position_count} in the "\
      "correct positions.\nYou've taken #{guess_count} guess(es)."\
      "\n#{advanced_guesses_txt}\nWhat is your next guess? (WARNING: If you "\
      "would like to cheat, type (C)heat,but BEWARE!!!)\nYou can always "\
      "choose to read the (I)nstructions or (Q)uit playing.\nPossible colors "\
      "are (B)lue, (C)yan, (G)reen, (P)urple, (R)ed, and (Y)ellow.\n>"\
  end

  def extreme_guess_txt(user_input, element_count, position_count, guess_count)
    puts "\e[H\e[2J"
    puts "\nYour guess of #{user_input} has #{element_count} "\
      "of the correct elements with #{position_count} in the "\
      "correct positions.\nYou've taken #{guess_count} guess(es)."\
      "\n#{extreme_guesses_txt}\nWhat is your next guess? (WARNING: If you "\
      "would like to cheat, type (C)heat,but BEWARE!!!)\nYou can always "\
      "choose to read the (I)nstructions or (Q)uit playing.\nPossible colors "\
      "are (B)lue, (C)yan, (G)reen, (P)urple, (R)ed, and (Y)ellow.\n>"\
  end

  def quit_txt
    puts "\e[H\e[2J"
    puts "\nLeaving so soon? Ah well...thanks for playing!!!\n\n"
  end

  def cheat_txt(guess_count)
    puts "\nYOU CHEATER!!! #{@answer.join.upcase} WAS the correct "\
    "answer!\nYou gave up after ONLY #{guess_count} guess(es)...you suck.\n"\
    "I'm kicking you back to start...have fun...hack."
  end

  def extreme_cheat_txt(guess_count)
    puts "\nYOU CHEATER!!! #{@answer.join} WAS the correct "\
    "answer!\nYou gave up after ONLY #{guess_count} guess(es)...you suck.\n"\
    "I'm kicking you back to start...have fun...hack."
  end

  def wrong_guess_txt
    " your guesses to the first letter of each of the colors.\n>"
  end

  def master_cheat_txt
    puts "\nMASTER!...The correct answer is #{@answer.join.upcase}!\nType it "\
    "in now to win.\n>"
  end

  def extreme_master_cheat_txt
    puts "\nMASTER!...The correct answer is #{@answer.join}!\nType it "\
    "in now to win.\n>"
  end

  def guesses_txt
    "Your past guess(es):\n\#\tGuess\t\tElements\tPositions\n"\
    "#{guess_table(input)}\n-------------------------------------------------"
  end

  def advanced_guesses_txt
    "Your past guess(es):\n\#\tGuess\t\tElements\tPositions\n"\
    "#{advanced_guess_table(input)}\n---------------------------------------"\
    '----------'
  end

  def extreme_guesses_txt
    "Your past guess(es):\n\#\tGuess\t\tElements\tPositions\n"\
    "#{extreme_guess_table(input)}\n"\
    '-------------------------------------------------'
  end
end
