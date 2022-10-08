class LandingPageController < ApplicationController
  def index
    @recipes = Recipe.includes(:recipes_foods).where(public: 't').order('id DESC')
  end
end
