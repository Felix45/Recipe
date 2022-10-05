require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { Recipe.new(name: 'Recipe two', preparation_time: 20, cooking_time: 60, description: 'This a recipe on how to cook spagheti', public: false) }

  before { subject.save }

  it 'name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description should not be empty' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'preparation_time should be an integer' do
    subject.preparation_time = -1
    expect(subject).to_not be_valid
  end

  it 'cooking_time should be an integer' do
    subject.cooking_time = -1
    expect(subject).to_not be_valid
  end
end
