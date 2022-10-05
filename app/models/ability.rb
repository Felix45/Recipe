class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Food do |food|
      food.user == user
    end

    can :create, Food
  end
end
