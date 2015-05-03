require_relative 'tile'
require 'colorize'

class Board
  attr_accessor :grid

  def self.seed_board(size, bombs)
    board = Board.new(size)
    loc = (0...size).to_a
    bombs.times { board.grid[loc.sample][loc.sample].bombed = true }
    board
  end

  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }

    (0...size).each do |row|
      (0...size).each { |col| @grid[row][col] = Tile.new([row, col], self) }
    end
  end

  def [](pos)
    y, x = pos
    self.grid[y][x]
  end

  def []=(pos, value)
    y, x = pos
    self.grid[y][x] = value
  end

  def iterate_grid(row_prc = nil, opt_prc = nil, &prc)
    (0...grid.length).each do |row|
      row_prc.call(row) unless row_prc.nil?
      (0...grid.length).each do |col|
        prc.call(row, col)
      end
      opt_prc.call
    end
  end

  def render
    row_prc = Proc.new { |row| print "#{row}:  "; print " " if row < 10}
    put_prc = Proc.new { puts }
    iterate_grid(row_prc, put_prc) do |row, col|
      tile = self.grid[row][col]
      if tile.flag == true
        print " F ".red
      elsif tile.revealed == false
        print " _ "
      else
        x = tile.neighborhood
       case x
       when 1
         x = "1".blue
       when 2
         x = "2".green
       when 3
         x = "3".yellow
       else
         x = "#{x}".red
       end
        print " #{x} "
      end
    end
  end
end
