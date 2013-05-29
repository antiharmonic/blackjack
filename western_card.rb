require_relative './card.rb'

class WesternCard < Card 
  def initialize(value, suit)
    @face = WesternFace.new(value)
    @suit = Suit.new(suit)
  end
  
  def face_card?
    if (@face > 10)
      return true
    else
      return false
    end
  end
  
  def ace?
    true if @face == 1
  end
end