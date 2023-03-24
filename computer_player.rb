# frozen_string_literal: true

class ComputerPlayer < Player
  DIFFICULTY_LEVELS = { 'easy' => 20, 'medium' => 60, 'hard' => 99 }.freeze

  attr_accessor :difficulty

  def move(board)
    move_pos = get_best_move(board)
    board.make_move(move_pos, marker)
  end

  private

  def get_best_move(board)
    return board.center_position if board.state[board.center_position] == board.center_position
    return board.available_positions.sample if rand(101) > DIFFICULTY_LEVELS[difficulty]

    board.available_positions.each do |space|
      board.make_move(space, marker)
      return space if board.game_over?

      board.reset_move(space)
    end

    board.available_positions.each do |space|
      board.make_move(space, next_player.marker)
      return space if board.game_over?

      board.reset_move(space)
    end

    board.available_positions.sample
  end
end
