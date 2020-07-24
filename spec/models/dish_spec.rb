require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "helper methods" do
    before :each do
      @chef = Chef.create(name: "Tony")
      @dish = @chef.dishes.create(name: "Spaghetti", description: "Mama mia, just like nonna used to make!")
      @ingredient1 = Ingredient.create(name: "Pasta", calories: 100)
      @ingredient2 = Ingredient.create(name: "Sauce", calories: 25)
      @ingredient3 = Ingredient.create(name: "Love", calories: 0)
      DishIngredient.create(dish_id: @dish.id, ingredient_id: @ingredient1.id)
      DishIngredient.create(dish_id: @dish.id, ingredient_id: @ingredient2.id)
      DishIngredient.create(dish_id: @dish.id, ingredient_id: @ingredient3.id)
    end

    it "uses #total_calories to calculate total calories for a dish" do
      expect(@dish.total_calories).to eq(125)
    end
  end
end
