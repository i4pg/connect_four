# frozen_string_literal: true

class Baord
  attr_accessor :rows, :current_row

  def initialize
    @rows = '=' * 6
    @current_row = 0
    @current_palyer = '+'
  end

  def hello
    @rows[@current_row] = @current_palyer
    @current_row += 1 unless @current_row == 6
  end
end

def pretty_print
  puts '   │'
  puts " 6 │ #{@a.rows[5]}   #{@b.rows[5]}   #{@c.rows[5]}   #{@d.rows[5]}   #{@e.rows[5]}   #{@f.rows[5]}   #{@g.rows[5]}"
  puts '   │'
  puts " 5 │ #{@a.rows[4]}   #{@b.rows[4]}   #{@c.rows[4]}   #{@d.rows[4]}   #{@e.rows[4]}   #{@f.rows[5]}   #{@g.rows[4]}"
  puts '   │'
  puts " 4 │ #{@a.rows[3]}   #{@b.rows[3]}   #{@c.rows[3]}   #{@d.rows[3]}   #{@e.rows[3]}   #{@f.rows[3]}   #{@g.rows[3]}"
  puts '   │'
  puts " 3 │ #{@a.rows[2]}   #{@b.rows[2]}   #{@c.rows[2]}   #{@d.rows[2]}   #{@e.rows[2]}   #{@f.rows[2]}   #{@g.rows[2]}"
  puts '   │'
  puts " 2 │ #{@a.rows[1]}   #{@b.rows[1]}   #{@c.rows[1]}   #{@d.rows[1]}   #{@e.rows[1]}   #{@f.rows[1]}   #{@g.rows[1]}"
  puts '   │'
  puts " 1 │ #{@a.rows[0]}   #{@b.rows[0]}   #{@c.rows[0]}   #{@d.rows[0]}   #{@e.rows[0]}   #{@f.rows[0]}   #{@g.rows[0]}"
  puts '   └───────────────────────────'
  puts '     a   b   c   d   e   f   g'
end

def take
  puts 'which letter ?'
  input = gets.chomp
  input = "@#{input}"
  p input
  input.hello(input)
end

def win
  arr = [@a, @b, @c, @d, @e, @f, @g]
  arr.each_with_index do |col, i|
    6.times do |row|
      current = col.rows[row]
      # vertical
      if current != '=' && current == arr[i + 1].rows[row] && current == arr[i + 2].rows[row] && current == arr[i + 3].rows[row]
        p current
      end
      # horz
      if current != '=' && current == arr[i].rows[row + 1] && current == arr[i].rows[row + 2] && current == arr[i].rows[row + 3]
        p current
      end
      # diag
      if current != '=' && current == arr[i + 1].rows[row + 1] && current == arr[i + 2].rows[row + 2] && current == arr[i + 3].rows[row + 3]
        p current
      end
      if current != '=' && current == arr[i - 1].rows[row + 1] && current == arr[i - 2].rows[row + 2] && current == arr[i - 3].rows[row + 3]
        p current
      end
    end
  end
end

@red = '+'
@yellow = '-'
@a = Baord.new
@b = Baord.new
@c = Baord.new
@d = Baord.new
@e = Baord.new
@f = Baord.new
@g = Baord.new
pretty_print
