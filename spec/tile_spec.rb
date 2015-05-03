require 'rspec'
require 'tile.rb'

describe Tile do
    describe "#New" do
        let(:tile) { Tile.new([5,5]) }
        
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
    
end

