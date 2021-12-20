require_relative '../player'

describe Player do
  
  context "#initialize" do 
    
    it "can be initialized with valid input hash" do 
      valid_hash = { name: "John", color: "X" }
      expect { Player.new(valid_hash).not_to raise_error }
    end
    
    it "raises error when initialized with invalid input hash" do 
      invalid_hash = { }
      expect { Player.new(invalid_hash).to raise_error }
    end
    
    
  end
  
  context "#name" do 
    
    subject(:example_player) { described_class.new({name: "John", color: "X"}) }
  
    it "returns the name" do
      expect(example_player.name).to eq "John"
    end 
    
    it "returns the color" do 
      expect(example_player.color).to eq "X"
    end 
  
  end
  
end
