# frozen_string_literal: true

class Player
  attr_accessor :next_player
  attr_reader :marker, :name

  def initialize(marker, name)
    @marker = marker
    @name = name
  end

  def move(board)
    raise NotImplementedError, 'Subclass must implement abstract method'
  end

  def take_turn(board)
    loop do
      move(board)
      break
    rescue ArgumentError => e
      puts e.message
    end
  end
end
