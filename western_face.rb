require_relative './face.rb'

class WesternFace < Face

  @@face_values = (1 .. 13).to_a
  
  def initialize(face)
    @face = face
  end
  
  def to_i
    @face
  end
  
  def to_s
    case @face
    when 13
      "King"
    when 12
      "Queen"
    when 11
      "Jack"
    when 1
      "Ace"
    else
      @face.to_s
    end
  end
  
  def self.face_values
    @@face_values
  end
end