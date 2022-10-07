require 'rails_helper'

RSpec.describe 'Recipe page', type: :feature do
  before(:each) do
    @user = User.new(name: 'Felix', username: "#{DateTime.now}", email: "#{DateTime.now}@gmail.com",
      password: '123456',
      password_confirmation: '123456'
    )
    @recipe = @user.recipes.new(name: 'Chicken stew', preparation_time: 10, cooking_time: 50, description: '500', public: 't')
  end

  describe 'Recipes list index page' do
    it 'shows the right content' do
      visit(root_path) 
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log In'
      visit(recipes_path)
      
      expect(page).to have_content('+ New recipe')
      click_link '+ New recipe'
      expect(page).to have_content('Add New Recipe')
      click_link 'Sign Out'
    end
  end

  describe 'Public Recipes page' do
    it 'shows the right content' do
      visit(root_path) 
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log In'
      visit(recipes_public_recipes_path)
      
      expect(page).to have_content('Public Recipes')
      click_link 'Sign Out'
    end
  end
end