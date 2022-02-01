# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'
require_relative 'winning'

# main class to run the game
class Main
  def initialize
    @start = Winning.new
  end

  def driver
    @start.game.pretty_print
    @start.game.take_input
    @start.game_over
    @start.draw?
    @start.game.players.switch_player
    driver unless @start.game_over
  end
end

new = Main.new
new.driver
