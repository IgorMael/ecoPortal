# frozen_string_literal: true

require './board'
require './player'

class HumanPlayer < Player
  def move(board)
    loop do
      puts "#{name}: Enter a number between 0 and 8:"
      input = gets.chomp.to_i
      return board.state[input] = @marker if board.state.include?(input)

      puts 'Invalid move. Please try again.'
    end
  end
end
