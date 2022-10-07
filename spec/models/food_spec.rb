require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Felix',
      username: "#{DateTime.now}",
      email: "#{DateTime.now}@gmail.com",
      password: '123456',
      password_confirmation: '123456'
    )
    @food = Food.create(
      name: 'Tomato',
      measurement_unit: 'litres',
      price: 50,
      quantity: 500,
      user: @user
    )
  end

  it '@food as created is valid' do
    expect(@food).to be_valid
  end

  it 'food name should be present' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'food quantity should be >= 0' do
    @food.quantity = -5
    expect(@food).to_not be_valid
  end

  it 'quantity should be numeric' do
    @food.quantity = 'One'
    expect(@food).to_not be_valid
  end

  it 'food price should be >= 0' do
    @food.price = -4
    expect(@food).to_not be_valid
  end

  it 'food price  should be numeric' do
    @food.price = 'One'
    expect(@food).to_not be_valid
  end

  it 'food owner is user who created it' do
    expect(@food.user.name).to eq 'Felix'
  end
end
