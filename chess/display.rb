require 'colorize'
require 'colorized_string'
require_relative 'cursor'
require_relative 'board'
require_relative 'piece'

class Display
  attr_reader :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @cursor.colorize
    puts "  #{(0..7).to_a.join(' | ')}"
    board.grid.each_with_index do |row, i|
      puts "#{i} #{row.map {|piece| piece}.join(' | ')}"
    end
  end

end
#
# "#{piece}"
# piece.to_s
