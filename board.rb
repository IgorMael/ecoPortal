# frozen_string_literal: true

class Board
  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6] # diagonals
  ].freeze

  CENTER_POSITION = 4

  attr_reader :state, :turn

  def initialize(player1, player2)
    @state = (0..8).to_a
    @player1 = player1
    @player2 = player2
    @turn = player1
  end

  def draw
    puts " #{state[0]} | #{state[1]} | #{state[2]} \n===+===+===\n #{state[3]} | #{state[4]} | #{state[5]} \n===+===+===\n #{state[6]} | #{state[7]} | #{state[8]} \n\n"
  end

  def winner
    WINNING_COMBINATIONS.each do |combination|
      values = combination.map { |i| state[i] }
      if values.uniq.length == 1
        winner_value = values.first
        return @player1.marker == winner_value ? @player1.name : @player2.name
      end
    end

    nil
  end

  def game_over?
    winner || tie?
  end

  def tie?
    state.all? { |value| value.is_a?(String) }
  end

  def available_positions
    state.select { |s| s.is_a? Numeric }
  end

  def make_move(position, marker)
    state[position] = marker
  end

  def reset_move(position)
    state[position] = position
  end

  def center_position
    CENTER_POSITION
  end
end
