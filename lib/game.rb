# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# game driver
class Game
  def initialize
    @a = Board.new
    @b = Board.new
    @c = Board.new
    @d = Board.new
    @e = Board.new
    @g = Board.new
    @f = Board.new
  end

  def take_input
    puts 'Choose a column'
    puts '[A, B, C, D, E, F, G]'
    input = gets.chomp
    check_input(input.downcase)
  end

  def check_input(input)
    return input if input =~ /^[abcdefg]$/

    puts 'invalid column'
    take_input
  end

  private

  attr_reader :a, :b, :c, :d, :e, :f, :g
end
