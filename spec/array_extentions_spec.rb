require_relative "spec_helper"
require "../array_extentions.rb"

describe Array do 
  context "#all_empty?" do 
    it "returns true if all elements of Array are empty" do 
      expect(['','','',''].all_empty?).to be true
    end
    
    it "returns false if some elements of the Array are not empty" do 
      expect(['', '', Object.new, ''].all_empty?).to be false
    end
    
    it "returns true for an empty Array" do 
      expect([].all_empty?).to be true
    end 
  end
  
  context "#all_same?" do 
    it "returns true if all elements of the Array are the same" do 
      expect(["X","X","X","X"].all_same?).to be true 
    end
    
    it "returns false if one or more elements of the Array are not the same" do 
      expect(['', Object.new, '', "X"].all_same?).to be false
    end
    
    it "returns true for an empty Array" do 
      expect([].all_same?).to be true
    end
  end
  
  context "any_empty?" do
    it "returns true if one or more elements of an Array are empty" do 
      expect([1, Object.new, '', :a].any_empty?).to be true
    end
    
    it "returns false if there are no empty elements in Array" do 
      expect([1, Object.new, "X", :a].any_empty?).to be false
    end
    
    it "returns true for a completely empty Array" do 
      expect([].any_empty?).to be true
    end
  end 
  context "none_empty?" do
    it "returns true if there are no empty elements in Array" do 
      expect([1, 4, Object.new, :a].none_empty?).to be true
    end
    
    it "returns false if there are any empty elements in Array" do 
      expect([1, 4, '', Object.new].none_empty?).to be false
    end
    
    it "returns false for a completely empty Array" do 
      expect([].none_empty?).to be false
    end
  end 
end 