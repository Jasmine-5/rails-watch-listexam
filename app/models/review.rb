class Review < ApplicationRecord
  belongs_to :list
  validates :comment, presence: true
  validates :rating, presence: true, numericality: {only_integer: true, greater_than_or_equal_to:1, less_then_or_equal_to: 10}
end
