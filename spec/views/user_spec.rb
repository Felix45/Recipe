require 'rails_helper'

RSpec.describe 'Index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Felix', username: "#{DateTime.now}", email: "#{DateTime.now}@gmail.com",
      password: '123456',
      password_confirmation: '123456'
    )
  end

  describe 'index page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Sign In Now')
    end

    it 'should have the right content' do
      visit root_path
      expect(page).to have_content("Don't have an account yet?")
    end

    it "Logs in with valid data" do
        visit(root_path) 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'Log In'
      
        expect(page).to have_content("#{@user.name}")
        expect(page).to have_content('Add food')
        expect(page).to have_content('Add recipe')
      end

      it "Logs user out correctly" do
        visit(root_path) 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'Log In'
        click_link 'Sign Out'
        expect(page).to have_content('Sign In Now')
      end

      it "Registration page has correct info" do
        visit(new_user_registration_path) 
        
        expect(page).to have_content('Name')
        expect(page).to have_content('Email')
        expect(page).to have_content('Username')
        expect(page).to have_content('Password')
        expect(page).to have_content('Password confirmation')
        expect(page).to have_content('Create a New Account Now')
      end
  end
end