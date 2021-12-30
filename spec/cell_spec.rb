#cell should:
# -have value attr
# -default to '' val
# -initialize without error
# -read/write val attr
# -have #print_cell method?

require_relative "spec_helper"
require "../cell.rb"

describe Cell do 
  context "#intitialize" do 
    
    it "is initialized with a default value of '' " do 
      cell = Cell.new(0,0)
      expect(cell.value).to eq ''
    end
    it "can be initialized with a value of 'X' " do 
      cell = Cell.new(0,0,"X")
      expect(cell.value).to eq "X"
    end 
  end 
end 