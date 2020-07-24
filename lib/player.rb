# frozen_string_literal: true

# Player class

class Player
  attr_accessor :name, :value_x, :value_o

  def initialize
    @name = 'Jogador'
    @value_x = 'X'
    @value_o = '0'
  end
end
