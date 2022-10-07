require 'rails_helper'

RSpec.describe 'Food page', type: :feature do
  before(:each) do
    @user = User.new(name: 'Felix', username: "#{DateTime.now}", email: "#{DateTime.now}@gmail.com",
      password: '123456',
      password_confirmation: '123456'
    )
    @food = Food.new(
        name: 'Tomato',
        measurement_unit: 'litres',
        price: 50,
        quantity: 500,
        user: @user
      )
  end

  describe 'Food list index page' do
    it 'shows the right content' do
      visit(root_path) 
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log In'
      visit(foods_path)
      
      expect(page).to have_content('Food List')
      expect(page).to have_link('Add Food')

      click_link 'Add Food'

      expect(page).to have_content('Name')
      expect(page).to have_content('Measurement unit')
      expect(page).to have_content('Price')
      expect(page).to have_content('Quantity')

      click_link 'Sign Out'
    end
  end
end