require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
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

  describe "visiting a dishes show page " do
    it "shows a list of ingredients and the chefs name " do

      visit "/dishes/#{@dish.id}"

      expect(page).to have_content("Dish: #{@dish.name}")
      expect(page).to have_content("Chef: #{@chef.name}")
      expect(page).to have_content("#{@ingredient1.name}")
      expect(page).to have_content("#{@ingredient2.name}")
      expect(page).to have_content("#{@ingredient3.name}")
    end

    it "shows the dishes total calorie count" do

      visit "/dishes/#{@dish.id}"

      expect(page).to have_content("Total Calories: 125")
    end
  end
end
