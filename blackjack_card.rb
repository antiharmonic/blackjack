require_relative './western_card.rb'

class BlackjackCard < WesternCard
  def card_value
    case @face.to_i
    when 13
      10
    when 12
      10
    when 11 #special
      10
    else
      @face.to_i
    end
  end
end