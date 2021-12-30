require_relative "cell.rb"

class Board 
  attr_reader :height, :width 
  attr_accessor :grid
  def initialize(input = {})
    @height = input.fetch(:height, 6)
    @width = input.fetch(:width, 7)
    @grid = input.fetch(:grid, make_grid)
  end 
  
  def print_board
    @width.times { |i| print "  #{i}   " }
    puts
    @grid.each do |row|
      row.each do |cell| 
        print_val = cell.value == "" ? "| #{cell.value}  | " : "| #{cell.value} | " 
        #print "| #{cell.value} | "
        print print_val
      end
      puts
    end 
  end
  
  def set_cell(x, y, value)
    get_cell(x,y).value = value
  end
  
  def get_cell(x, y)
    @grid[y][x]
  end
  
  def game_over
    for y in 0...@height
      for x in 0...@width
        horizontal = [[x, y], [x+1, y], [x+2, y], [x+3, y]]
        vertical = [[x, y], [x,y+1], [x, y+2], [x, y+3]]
        diag_DR = [[x, y], [x+1, y+1], [x+2, y+2], [x+3, y+3]]
        diag_DL = [[x, y], [x-1, y+1], [x-2, y+2], [x-3, y+3]]
        
        if win?(horizontal) || win?(vertical) || win?(diag_DL) || win?(diag_DR)
          return :winner
        end 
      end 
    end
    
    return :draw if draw?
    
    return false 
  end 
  
  private 
  
  def make_grid
    grid = []
    (@height).times { |row| grid.push(Array.new(@width) { |col| Cell.new(row, col) }) }
    return grid 
  end 
  
  def draw?
    return true if @grid.each { |row| row.none_empty? }
    return false
  end
  
  def win?(cells)
    #cells is list of x, y coords
    if cells.all? { |coordnates| coordnates[0].between?(0, @width-1) && coordnates[1].between?(0, @height-1) }
      cell_values = []
      cells.each { |coordnates| cell_values.push(get_cell(coordnates[0], coordnates[1]).value) }
      if cell_values.all_same? && cell_values[0] != ''
        return true
      end 
    end 
    false
  end
  
end
    

board = Board.new({})
board.print_board

board.set_cell(2, 1, "X")
board.set_cell(6, 5, "O")
board.print_board