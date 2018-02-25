guess = 'rggb'
answer = ['b','b','y','g']

def element(guess)
  count = 0
  answer.each do |letter|

end
def evaluate_user_input(input)
  case input
  when 'p', 'play' then start_game
  when 'q', 'quit' then quit_game.abort
  when 'i', 'instructions' then info
  end
  input
end
