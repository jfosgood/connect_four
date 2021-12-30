class Cell 
  attr_accessor :value
  attr_reader :row, :col 
  def initialize(row, col, value = '')
    @value = value
    @row = row
    @col = col
  end 
end 