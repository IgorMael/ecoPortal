# frozen_string_literal: true

require './board'
require './human_player'
require './computer_player'

class Game
  PLAYER_TYPES = { 'h' => HumanPlayer, 'c' => ComputerPlayer }.freeze
  DIFFICULTY_TYPES = { 'e' => 'easy', 'm' => 'medium', 'h' => 'hard' }.freeze

  def start
    welcome_message

    player1 = create_player('Player One', 'X')
    player2 = create_player('Player Two', 'O')
    player1.next_player = player2
    player2.next_player = player1

    board = Board.new(player1, player2)

    play(player1, player2, board)

    game_over_message(board)
  end

  private

  def welcome_message
    puts '''

    _______ _   _______      _______
   |__   __(_) |__   __|    |__   __|
      | |   _  ___| | __ _  ___| | ___   ___
      | |  | |/ __| |/ _` |/ __| |/ _ \ / _ \
      | |  | | (__| | (_| | (__| | (_) |  __/
      |_|  |_|\___|_|\__,_|\___|_|\___/ \___|


  Welcome to the TicTacToe. Let\'s play
  '''
  end

  def play(player1, player2, board)
    until board.game_over?
      board.draw
      player1.take_turn(board)
      break if board.game_over?

      board.draw
      player2.take_turn(board)
    end
  end

  def game_over_message(board)
    board.draw
    if board.tie?
      puts "It's a tie!"
    else
      puts "#{board.winner} wins!"
    end
    puts 'Game Over!'
  end

  def create_player(label, marker)
    player = nil

    loop do
      puts "Please choose the #{label} type: (H)uman or (C)omputer"
      input = gets.chomp.downcase.chr
      player = PLAYER_TYPES[input].new(marker, label) unless PLAYER_TYPES[input].nil?
      player.difficulty = prompt_difficulty if PLAYER_TYPES[input] == ComputerPlayer

      break unless player.nil?
    end

    player
  end

  def prompt_difficulty
    loop do
      puts 'Please choose choose the difficulty level: (e)asy, (m)edium or (h)ard'
      input = gets.chomp.downcase.chr
      return DIFFICULTY_TYPES[input] unless DIFFICULTY_TYPES[input].nil?
    end
  end
end

game = Game.new
game.start
