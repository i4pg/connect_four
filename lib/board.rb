# frozen_string_literal: true

# board class
class Board
  attr_accessor :current_row, :rows

  def initialize
    @rows = '=' * 6
    @current_row = 0
  end
end
