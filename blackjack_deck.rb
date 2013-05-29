require_relative './western_deck.rb'

class BlackjackDeck < Deck
  def initialize
    super
    WesternSuit.suits.each do |suit|
      #puts suit
      WesternFace.face_values.each do |face|
        #puts face
        @deck.push(BlackjackCard.new(face, suit))
      end
    end
    shuffle_deck(@@shuffle_amount)
  end
end