# frozen_string_literal: true

# Board class

require_relative 'player.rb'

class Board < Player
  attr_accessor :board, :player1, :player2

  def initialize(player1, player2)
    @board = (1..9).to_a
    @player1 = player1
    @player2 = player2
    @counts = 0
    @wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def show_board
    "
    #{board[0]} | #{board[1]} | #{board[2]}
    ---------
    #{board[3]} | #{board[4]} | #{board[5]}
    ---------
    #{board[6]} | #{board[7]} | #{board[8]} \n
    "
  end

  def swap_players
    # Define que quem inicia e o player com o 0
    if @counts.odd?
      player1.value_x
    else
      player2.value_o
    end
  end

  def won?
    @wins.each do |result|
      win_comb = [board[result[0]], board[result[1]], board[result[2]]]
      return true if win_comb.all? { |x| x == '0' }
      return true if win_comb.all? { |x| x == 'X' }
    end
  end

  def winner
    @wins.each do |result|
      win_comb = [board[result[0]], board[result[1]], board[result[2]]]
      return "O vencedor é #{player2.name}!" if win_comb.all? { |x| x == '0' }
      return "O vencedor é #{player1.name}!" if win_comb.all? { |x| x == 'X' }
    end
  end
end
