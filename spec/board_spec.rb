require 'rspec'
require 'board'

describe Board do
  
  describe "Board.seed_board" do
    let(:board) { Board.seed_board(12, 10) }
    
    
    it "creates a new instance of a board" do
      new_board = board
      
      expect(new_board.class).to eq(Board)
    end
  end
end