require 'rspec'
require 'board'

describe Board do
  subject(:board) { Board.seed_board(12, 10) }

  describe "self#seed_board" do

    it "creates a new instance of a board" do

      expect(board.class).to eq(Board)
    end

    it "seeds the board with bombs" do
      count = 0
      board.grid.each do |row|
        row.each {|item| count += 1 if item.bombed? == true}
      end
      expect(count).to eq(10)
    end
  end

  describe "#[]" do

    it "accesses the board using synactic sugar" do
      expect(board[[5, 5]].flag).to eq(false)
    end

    it "assigns a new value using synactic sugar" do
      subject[[5,5]].flag = true

      expect(board[[5, 5]].flag).to eq(true)
    end
  end
end
