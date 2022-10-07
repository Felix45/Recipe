class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Food do |food|
      food.user == user
    end

    can :update, Recipe do |recipe|
      recipe.user == user
    end

    can :destroy, Recipe do |recipe|
      recipe.user == user
    end

    can :create, Food
    can :create, Recipe
  end
end
