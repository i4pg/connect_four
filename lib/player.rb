# frozen_string_literal: true

require_relative 'baord'

# assign players and switch between them
class Players
  def initialize
    @player_one = '+'
    @player_two = '-'
    @current_player = @player_one
  end

  def take_input
    puts 'Choose a column'
    puts '[A, B, C, D, E, F, G]'
    input = gets.chomp
  end

  def switch_player
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end
end
