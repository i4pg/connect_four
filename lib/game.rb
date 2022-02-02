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
    puts "Player #{@players.current_player} turn"
    puts 'Please, Choose column'
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
    input.rows[input.current_row] = @players.current_player
    next_row(input)
  end

  def next_row(input)
    if input.current_row == 6
      puts 'This column is full, Please choose another column'
      pretty_print
      return take_input
    end

    input.current_row += 1
  end

  def pretty_print
    puts '   │'
    puts " 6 │ #{@a.rows[5]}   #{@b.rows[5]}   #{@c.rows[5]}   #{@d.rows[5]}   #{@e.rows[5]}   #{@f.rows[5]}   #{@g.rows[5]}"
    puts '   │'
    puts " 5 │ #{@a.rows[4]}   #{@b.rows[4]}   #{@c.rows[4]}   #{@d.rows[4]}   #{@e.rows[4]}   #{@f.rows[4]}   #{@g.rows[4]}"
    puts '   │'
    puts " 4 │ #{@a.rows[3]}   #{@b.rows[3]}   #{@c.rows[3]}   #{@d.rows[3]}   #{@e.rows[3]}   #{@f.rows[3]}   #{@g.rows[3]}"
    puts '   │'
    puts " 3 │ #{@a.rows[2]}   #{@b.rows[2]}   #{@c.rows[2]}   #{@d.rows[2]}   #{@e.rows[2]}   #{@f.rows[2]}   #{@g.rows[2]}"
    puts '   │'
    puts " 2 │ #{@a.rows[1]}   #{@b.rows[1]}   #{@c.rows[1]}   #{@d.rows[1]}   #{@e.rows[1]}   #{@f.rows[1]}   #{@g.rows[1]}"
    puts '   │'
    puts " 1 │ #{@a.rows[0]}   #{@b.rows[0]}   #{@c.rows[0]}   #{@d.rows[0]}   #{@e.rows[0]}   #{@f.rows[0]}   #{@g.rows[0]}"
    puts '   └───────────────────────────'
    puts '     A   B   C   D   E   F   G'
  end

  private

  # to transfer the input to it is correct column (instance_variable)
  def which_column(input)
    case input
    when 'a'
      assign_input(instance_variable_get(:@a))
    when 'b'
      assign_input(instance_variable_get(:@b))
    when 'c'
      assign_input(instance_variable_get(:@c))
    when 'd'
      assign_input(instance_variable_get(:@d))
    when 'e'
      assign_input(instance_variable_get(:@e))
    when 'f'
      assign_input(instance_variable_get(:@f))
    when 'g'
      assign_input(instance_variable_get(:@g))
    end
  end
end
