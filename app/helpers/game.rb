# frozen_string_literal: true

# Game class

require_relative 'board.rb'

class Game < Board
  def valid_move?(num)
    board.include?(num)
  end

  def move(num)
    count(num)
    swap(num) if valid_move?(num)
    show_board
  end

  def count(num)
    @counts += 1 if valid_move?(num)
  end

  def invalid
    'Movimento inválido! Tente outra vez.'
  end
end
