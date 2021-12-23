#player should:
# -have name
# -have 'color' designation
# -maybe a #solicit_move method?

#tests:
#initialized with valid hash
# -no errors
# -has color 
# -has name 
#initialized with invalid hash
# -throws error


require_relative "spec_helper"
require "../player.rb"

describe Player do 
  context "#initialize" do
    
    it "raises an error when initialized with invalid hash" do 
      expect { Player.new({}) }.to raise_error 
    end 
    
    it "does not raise an error when initialized with valid hash" do 
      input = { color: "X", name: "Someone" }
      expect { Player.new(input) }.not_to raise_error
    end 
  end
  
  context "#name" do
    
    it "returns the player's name" do
      input = { color: "X", name: "Someone" }
      player = Player.new(input)
      expect(player.name).to eq "Someone"
    end 
  end 
  context "#color" do
    
    it "returns the player's color" do 
      input = { color: "X", name: "Someone" }
      player = Player.new(input)
      expect(player.color).to eq "X"
    end 
  end 
end 