#slots

class reel
  attr_accessor :symbol
  
  def initialize(symbol) 
    @symbol = ["plum","goose","cards","knife","dog","pikachu"]
  end

  def spin_reel
    @symbol.sample()
  end
end

reel.spin_reel
# class Lineup


