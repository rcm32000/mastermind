class Strings

  def welcome_txt
    "Welcome to MASTERMIND!!!\n"
    "Would you like to (p)lay, "\
    "read the (i)structions, "\
    "or (q)uit?\n"\
    ">"
  end

  def start_txt
    "I have generated a beginner sequence with four "\
    "elements made up of: (r)ed, (g)reen, (b)lue, and "\
    "(y)ellow. Use (q)uit at any time to end the game.\n"\
    "What's your guess?\n"
  end

  def info_txt
    "MasterMind consists of the colors Red, Green, Blue, "\
    "and Yellow.  Four slots will randomly be filled with "\
    "one or more of these colors.  The object of the game "\
    "is to figure out what color(s) are being used, and in "\
    "what order.\n"\
    "You will receive feedback after each guess saying how "\
    "many elements or colors you guesses correctly, and how "\
    "many of them were in the correct slot.\n"\
    "Would you like to (p)lay or (q)uit?"
  end

  def quit_txt
    "Leaving so soon? Ah well...thanks for playing!!!"
  end

end
