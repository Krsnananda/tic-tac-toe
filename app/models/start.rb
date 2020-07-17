# frozen_string_literal: true

# script que inicia o jogo

require_relative '../helpers/board.rb'
require_relative '../helpers/player.rb'
require_relative '../helpers/game.rb'

puts 'Bem-vindo ao Jogo da Velha! (Welcome to Tic Tac Toe!)'

puts 'Jogador 1 digite seu nome'
player1 = Player.new
player1.name = gets.chomp.capitalize
puts "#{player1.name} jogará usando #{player1.value_x}\n\n"

puts 'Jogador 2 digite seu nome'
player2 = Player.new
player2.name = gets.chomp.capitalize
puts "#{player2.name} jogará usando #{player2.value_x}\n\n"

gameboard = Board.new(player1, player2)
puts gameboard.show_board

play = Game.new(player1, player2)
turns = 1

while play.won? == false && turns < 10
  if turns.odd?
    puts "#{player1.name} escolha um número de 1 a 9"
  else
    puts "#{player2.name} escolha um número de 1 a 9"
  end

  chosen = gets.chomp.to_i

  while play.valid_move?(chosen) == false
    puts play.invalid
    chosen = gets.chomp.to_i
    play.valid_move?(chosen)
  end

  puts play.move(chosen)

  puts play.winner if play.won?
  turns += 1
end

puts 'Deu empate, fim de jogo!' if turns == 10 && !play.won?
