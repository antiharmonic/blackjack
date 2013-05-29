class Suit
  @@suit_values = []
  
  def initialize(suit)
    @suit = suit
  end
  
  def to_s
    @suit.capitalize
  end
  
  def self.suits
    @@suit_values
  end
  
end