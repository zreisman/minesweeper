require 'rspec'
require 'tile'
require 'board'

describe Tile do
  let(:tile) { Tile.new([5,5]) }

    describe "#New" do


        it "initializes with a position" do

            expect(tile.pos).to eq([5,5])
        end

        it "allows position to be changed" do
            tile.pos = [7,7]

            expect(tile.pos).to eq([7,7])
        end

        it "bomb flag is changed" do
            tile.bombed = true

            expect(tile.bombed).to eq(true)
        end

        it "flag is changed" do
            tile.flag = true

            expect(tile.flag).to eq(true)
        end

        it "reveal flag is changed" do
            tile.revealed = true

            expect(tile.revealed).to eq(true)
        end

    end

    describe "#vector_add" do

      it "calculates vectors of current position" do

        expect(tile.vector_add(-1, 1)).to eq([4, 6])
        expect(tile.vector_add(1, -1)).to eq([6, 4])
      end
    end

    describe "#neighborhood" do
      let(:board) { Board.seed_board(12, 200) }

      it "finds the number of neighborhood bombs" do

        expect(board[[4,4]].neighborhood).to be >= 2
      end
    end

end
