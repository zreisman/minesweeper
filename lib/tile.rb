class Tile
    attr_accessor :pos, :revealed, :flag, :bombed
    
   def initialize(pos)
       @pos = pos
       @revealed = false
       @flag = false
      @bombed = false 
   end
    
    
end