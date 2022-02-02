# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'

# a class for the winning conditions
class Winning
  attr_accessor :game, :counter

  def initialize
    @game = Game.new
    @counter = 0
  end

  def game_over
    @counter += 1
    arr = [@game.a, @game.b, @game.c, @game.d, @game.e, @game.f, @game.g]
    arr.each_with_index do |col, i|
      6.times do |row|
        current = col.rows[row]
        next unless current != '=' && @counter >= 7
        next if arr[i + 1].nil? || arr[i + 2].nil? || arr[i + 3].nil?
        # vertical
        if current == arr[i + 1].rows[row] &&
           current == arr[i + 2].rows[row] &&
           current == arr[i + 3].rows[row]
          return congrats(current)
        # horz
        elsif current == arr[i].rows[row + 1] &&
              current == arr[i].rows[row + 2] &&
              current == arr[i].rows[row + 3]
          return congrats(current)
        # diag
        elsif current == arr[i + 1].rows[row + 1] &&
              current == arr[i + 2].rows[row + 2] &&
              current == arr[i + 3].rows[row + 3]
          return congrats(current)
        elsif current == arr[i - 1].rows[row + 1] &&
              current == arr[i - 2].rows[row + 2] &&
              current == arr[i - 3].rows[row + 3]
          return congrats(current)
        end
      end
    end
    nil
  end

  def congrats(winner)
    puts "Congrats!! Player #{winner} Won the game."
  end

  def draw?
    return true if @counter == 42 # && game_over.nil?
  end
end
