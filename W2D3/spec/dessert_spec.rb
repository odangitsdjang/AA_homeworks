require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "david") }
  let(:ice_cream) { Dessert.new("icecream",2, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(ice_cream.type).to eq("icecream")
    end

    it "sets a quantity" do
      expect(ice_cream.quantity).to eq(2)
    end

    it "starts ingredients as an empty array" do
      expect(ice_cream.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("hello","wrong",:chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(ice_cream.add_ingredient("boom")).to eq(["boom"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "egg", "sugar", "butter", "x", "y", "x", "y", "zz", "zz"]

      ingredients.each do |ingredient|
        ice_cream.add_ingredient(ingredient)
      end
      expect(ice_cream.ingredients).to eq(ingredients)
      expect(ice_cream.mix!).not_to eq(ingredients)
    end

    it "takes in a shuffle method" do
      expect(ice_cream).to receive(:mix!)
      ice_cream.mix!
    end
  end
  # describe "some_other_function"  do
  #   it "calls each" do
  #     expect(ice_cream).to receive(:each)
  #     ice_cream.some_other_function
  #   end
  # end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(ice_cream.eat(1)).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ice_cream.eat(3)}.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef David the Great Baker")
      expect(ice_cream.serve).to eq("Chef David the Great Baker has made 2 icecreams!")


    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(ice_cream)
      ice_cream.make_more
    end
  end
end
