# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'

# a class for the winning conditions
class Winning
  def game_over
    arr = [@a, @b, @c, @d, @e, @f, @g]
    arr.each_with_index do |col, i|
      6.times do |row|
        current = col.rows[row]
        # vertical
        if current != '=' && current == arr[i + 1].rows[row] && current == arr[i + 2].rows[row] && current == arr[i + 3].rows[row]
          current
        end
        # horz
        if current != '=' && current == arr[i].rows[row + 1] && current == arr[i].rows[row + 2] && current == arr[i].rows[row + 3]
          current
        end
        # diag
        if current != '=' && current == arr[i + 1].rows[row + 1] && current == arr[i + 2].rows[row + 2] && current == arr[i + 3].rows[row + 3]
          current
        end
        if current != '=' && current == arr[i - 1].rows[row + 1] && current == arr[i - 2].rows[row + 2] && current == arr[i - 3].rows[row + 3]
          current
        end
      end
    end
  end
end
