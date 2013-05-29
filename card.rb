class Card
  def initialize(value, suit)
    @face = Face.new(value)
    @suit = Suit.new(suit)
  end
  
  def to_s
    "#{@face} of #{@suit}"
  end
  
  def card_value
    @face.to_i
  end
  
  def to_i
    card_value
  end
end