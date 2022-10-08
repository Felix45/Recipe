require 'rails_helper'
require 'date'

RSpec.describe RecipesFood, type: :model do
  before(:all) do
    @user = User.create(name: 'Felix', username: DateTime.now.to_s, email: "#{DateTime.now}@gmail.com",
                        password: '123456',
                        password_confirmation: '123456')
    @food = @user.foods.new(name: 'Tomato', measurement_unit: 'litres', price: 50, quantity: 500)
    @recipe = @user.recipes.new(name: 'Chicken stew', preparation_time: 10, cooking_time: 50, description: '500', public: 't')
    @recipes_foods = RecipesFood.new(recipe: @recipe, food: @food, quantity: 5)
  end

  it '@recipe_foods as created is valid' do
    expect(@recipes_foods).to be_valid
  end

  it 'recipe_foods name should be same as food item' do
    expect(@recipes_foods.food.name).to eq(@food.name)
  end

  it 'recipes_foods quantity should be >= 0' do
    @recipes_foods.quantity = -5
    expect(@recipes_foods).to_not be_valid
  end

  it 'recipes_foods quantity should be numeric' do
    @recipes_foods.quantity = 'One'
    expect(@recipes_foods).to_not be_valid
  end

  it 'recipes_foods quantity should be present' do
    @recipes_foods.quantity = nil
    expect(@recipes_foods).to_not be_valid
  end

  it 'recipes_foods reciper is recipe it was created in' do
    expect(@recipes_foods.recipe.name).to eq(@recipe.name)
  end
end
