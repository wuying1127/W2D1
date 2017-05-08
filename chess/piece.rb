class Piece
  attr_accessor :pos, :key

  def initialize(key)
    @key = "K"
    # @pos = pos
  end

  def to_s
    key
  end

end

class NullPiece < Piece

  def initialize(key = "_")
    @key = key
    # @pos = pos
  end

  def to_s
    key
  end
end
