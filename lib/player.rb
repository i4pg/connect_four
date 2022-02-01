# frozen_string_literal: true

require_relative 'board'

# assign players and switch between them
class Players
  attr_accessor :player_one, :player_two, :current_player

  def initialize
    @player_one = '+'
    @player_two = '-'
    @current_player = @player_one
  end

  def switch_player
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end
end
