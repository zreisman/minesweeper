require 'tile'

class Board
  attr_accessor :grid
  
  self.seed_board(size, bombs)
    board = Board.new(size)
    loc = (0...size).to_a
    bombs.times { board[loc.sample][loc.sample].bombed = true }
    board
  end
 
  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
    
    (0...size).each do |row|
      (0...size).each { |col| @grid[row][col] = Tile.new([row, col]) }
    end
  end
end