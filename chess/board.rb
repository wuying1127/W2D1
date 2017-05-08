require_relative "piece"

class Board
  attr_reader :grid

  def self.empty_grid
    Array.new(8) {Array.new(8)}
  end

  def initialize()
    @grid = Board.empty_grid
    @grid.each_with_index do |row, i|
      if i.between?(2, 5)
        row.map! {|pos| NullPiece.new } 
      else
        row.map! {|pos| Piece.new(nil)}
      end
    end
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise InvalidPosError.new("No piece exists at start position")
    elsif !valid_pos?(start_pos) || !valid_pos?(end_pos)
      raise InvalidPosError.new("Please input valid position (ex. 0,0)")
    end

  rescue InvalidPosError
    puts "Fix this later"
  else
    piece = self[start_pos]
    piece.pos = end_pos
    self[end_pos] = piece
    self[start_pos] = nil
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def valid_pos?(pos)
    pos.all? {|coordinate| coordinate.between?(0, 7)}
  end

end

class InvalidPosError < StandardError
end

board = Board.new
