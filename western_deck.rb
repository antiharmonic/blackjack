require_relative './deck.rb'
require_relative './western_suit.rb'
require_relative './western_card.rb'
require_relative './western_face.rb'

class WesternDeck < Deck
  def initialize
    super
    WesternSuit.suits.each do |suit|
      #puts suit
      WesternFace.face_values.each do |face|
        #puts face
        @deck.push(WesternCard.new(face, suit))
      end
    end
    shuffle_deck(@@shuffle_amount)
  end
end