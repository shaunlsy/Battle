class Player 
  attr_reader :name 

HIT_POINTS = 100 
DMG = 10

  def initialize(name)
    @name = name 
  end 

  def dmg 
    HIT_POINTS - DMG 
  end 
end 