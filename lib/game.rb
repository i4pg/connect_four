# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# game driver
class Game
  attr_accessor :a, :b, :c, :d, :e, :f, :g, :players

  def initialize
    @a = Board.new
    @b = Board.new
    @c = Board.new
    @d = Board.new
    @e = Board.new
    @g = Board.new
    @f = Board.new
    @players = Players.new
  end

  def take_input
    puts 'Choose a column'
    puts '[A, B, C, D, E, F, G]'
    input = gets.chomp
    check_input(input.downcase)
  end

  def check_input(input)
    return which_column(input) if input =~ /^[abcdefg]$/

    puts 'invalid column'
    take_input
  end

  def assign_input(input)
    input.rows[input.current_row] = @players.current_player unless input.current_row =~ /^[+-]$/
    next_row(input)
  end

  def next_row(input)
    input.current_row += 1 unless input.current_row == 6
  end

  # to transfer the input to it is correct column (instance_variable)
  def which_column(input)
    case input
    when a
      assign_input(instance_variable_get(:@a))
    when b
      assign_input(instance_variable_get(:@b))
    when c
      assign_input(instance_variable_get(:@c))
    when d
      assign_input(instance_variable_get(:@d))
    when e
      assign_input(instance_variable_get(:@e))
    when f
      assign_input(instance_variable_get(:@f))
    when g
      assign_input(instance_variable_get(:@g))
    end
  end
end
