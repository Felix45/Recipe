class RecipesFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  has_one :user, through: :recipe

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
