class Face
  
  @@face_values = []
  
  def initialize(face)
    @face = face.to_i
  end
  
  def to_i
    @face
  end
  
  def to_s
    @face.to_s
  end
  
  def self.face_values
    @@face_values
  end
end