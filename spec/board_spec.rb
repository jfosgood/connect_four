require_relative '../board'

describe Board do
  
  context "initialize" do 
    
    it "initializes when provided hash with 'grid' key" do 
      expect { Board.new(grid: "grid") }.to_not raise_error
    end
    
    it "sets the grid to have 7 columns by default" do 
      expect { Board.new }.to have(7).things
    end 
    
    it "creates 6 rows in each column by default" do 
      board = Board.new 
      board.grid.each do | column | 
        expect(column).to have(6).things
      end 
    end 
  end 
end