require_relative './deck.rb'

class Hand < Deck

  def give(card)
    @deck.push(card)
  end

  def newhand
    ret = @deck
    @deck = []
    @dealt = []
    @discard = []
    ret
  end
  
  def to_a
    @deck
  end
  
  def to_s
    @deck.to_s
  end
  
  def ace_in_hand?
    @deck.each do |card|
      if card.to_i == 1
        return true
      end
    end
    return false
  end
end