require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("sweet", 3, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("sweet")
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(3)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("sweet", "3", chef ) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("cream")
      expect(dessert.ingredients).to eq(["cream"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("salt")
      dessert.add_ingredient("cream")
      dessert.mix!
      expect(dessert.ingredients).to eq(["cream", "salt"]) | eq(["salt", "cream"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      expect(dessert.quantity).to eq(2)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(4) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef chef the Great Baker")
      expect(dessert.serve).to start_with("Chef chef the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      dessert.add_ingredient("cream")
      dessert.add_ingredient("salt")
      allow(chef).to receive(:bake).with(dessert)
      dessert.make_more
      # expect(dessert.ingredients).to eq(["cream", "salt"]) | eq(["salt", "cream"])
      # expect(dessert.temp).to eq(400)
    end
  end
end
