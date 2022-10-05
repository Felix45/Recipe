require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:example) { get '/recipes' }
    it 'redirects' do
      expect(response).to have_http_status(:found)
    end
  end
end
