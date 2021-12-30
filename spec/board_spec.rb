#board should:
# -have 6 rows, 7 columns by default
#     - readable attrs
# -be full of cell objects
# -have a #get_cell(x,y) method that returns instance of cell at x,y
#     - should return nil if x or y is out of range of board
# -have a #drop_marker(col, val) method that inserts value at lowest empty poss in col
# -have #get_winning_poss(x, y)
#     - uses #get_cell to return list of all combos of 4 that include given coords
# -have #print_board method that prints visual of cells with values

require_relative "spec_helper"
require "../board.rb"

describe Board do 
  context "#initialize" do 
    
    it "intitializes board with a height and width" do 
      expect { Board.new({height: 6, width: 7}) }.not_to raise_error
    end
    
    it "sets the grid to have 6 rows by default" do
      board = Board.new
      expect(board.grid.length).to eq(6)
    end 
    
    it "creates 7 things in each row by default" do 
      board = Board.new 
      board.grid.each do | row |
        expect(row.length).to eq(7) 
      end 
    end 
  end
  
  context "#height" do 
    it "returns the height" do 
      board = Board.new({height: 6, width: 7})
      expect(board.height).to eq 6
    end 
  end
  
  context "#width" do 
    it "returns the width" do 
      board = Board.new({height: 6, width: 7})
      expect(board.width).to eq(7)
    end 
  end
  
  context "#get_cell" do
    it "returns cell based on (x, y) coordnate" do 
      row = ['', '', '', '', '', '', '']
      grid = []
      (5).times { grid.push(row) }
      example_row = ['', '', '', 'Something', '', '', '']
      grid.push(example_row)
      board = Board.new(grid: grid)
      expect(board.get_cell(3, 5)).to eq "Something"
    end
  end
  
  context "#set_cell" do 
    it "updates value of cell at (x, y) coordnate" do 
      Cat = Struct.new(:value)
      row = ['', '', '', '', '', '', '']
      grid = []
      (5).times { grid.push(row) }
      example_row = [Cat.new("cool"), '', '', '', '', '', '']
      grid.unshift(example_row)
      board = Board.new(grid: grid)
      board.set_cell(0, 0, "meow")
      expect(board.get_cell(0, 0).value).to eq "meow"
    end
  end
  
  context "#game_over" do 
    it "returns :winner if winner? is true" do
      board = Board.new 
      board.stub(:win?) { true }
      expect(board.game_over).to eq :winner
    end 
    it "returns :draw if winner? is false and draw? is true" do
      board = Board.new 
      board.stub(:win?) { false }
      board.stub(:draw?) { true }
      expect(board.game_over).to eq :draw
    end 
    it "returns false if winner? and draw? are both false" do 
      board = Board.new 
      board.stub(:win?) { false }
      board.stub(:draw?) { false }
      expect(board.game_over).to be false
    end 
  end
end