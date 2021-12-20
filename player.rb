class Player 
  attr_accessor :name, :color
  
  def initialize(hash)
    @name = hash.fetch(:name)
    @color = hash.fetch(:color)
  end 
  
end