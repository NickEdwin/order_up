require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  before :each do
    @chef = Chef.create(name: "Tony")
    @dish1 = @chef.dishes.create(name: "Spaghetti", description: "Mama mia, just like nonna used to make!")
    @dish2 = @chef.dishes.create(name: "Steak", description: "Vegetarians stay away!")
    @ingredient1 = Ingredient.create(name: "Pasta", calories: 100)
    @ingredient2 = Ingredient.create(name: "Sauce", calories: 25)
    @ingredient3 = Ingredient.create(name: "Love", calories: 0)
    @ingredient4 = Ingredient.create(name: "Kobe Beef", calories: 400)
    @ingredient5 = Ingredient.create(name: "Garlic", calories: 20)
    @ingredient6 = Ingredient.create(name: "Salt", calories: 5)
    @ingredient7 = Ingredient.create(name: "Pepper", calories: 4)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
    DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
    DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient5.id)
    DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient6.id)
    DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient7.id)
  end

  describe "visiting a chefs show page " do
    it "shows the chefs name and a link to their ingredients" do

      visit "/chefs/#{@chef.id}"

      expect(page).to have_content("#{@chef.name}")

      expect(page).to have_link("Ingredients Used by Chef #{@chef.name}")
      click_on "Ingredients Used by Chef #{@chef.name}"

      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")

      expect(page).to have_content("All Ingredients Used by Chef #{@chef.name}")

      expect(page).to have_content("#{@ingredient1.name}")
      expect(page).to have_content("#{@ingredient2.name}")
      expect(page).to have_content("#{@ingredient3.name}")
      expect(page).to have_content("#{@ingredient4.name}")
      expect(page).to have_content("#{@ingredient5.name}")
      expect(page).to have_content("#{@ingredient6.name}")
      expect(page).to have_content("#{@ingredient7.name}")
    end
  end
end
