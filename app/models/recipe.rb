class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
end
