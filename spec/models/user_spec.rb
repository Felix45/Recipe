require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: 'andre@gmail.com', password: 'test123', name: 'Andre Odhiambo', username: 'andre12') }

  before { subject.save }

  it 'name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post should not be blank' do
    subject.name = '   '
    expect(subject).to_not be_valid
  end
end
