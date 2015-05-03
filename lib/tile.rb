class Tile
    attr_accessor :pos, :revealed, :flag, :bombed

   def initialize(pos, board = nil)
       @pos = pos
       @revealed = false
       @flag = false
      @bombed = false
      @board = board
   end

   def bombed?
     @bombed
   end

   def neighborhood
     count = 0
     (-1..1).each do |y_mod|
       (-1..1).each do |x_mod|
         vector = vector_add(y_mod, x_mod)
                              # Adjust below for variable board size.
         next unless vector.all? {|v| v.between?(0,11) }
         count += 1 if @board[vector].bombed? == true
       end
     end
     count
   end

   def vector_add(y_mod, x_mod)
     self.pos.zip([y_mod, x_mod]).map {|i| i.first + i.last}
   end

end
