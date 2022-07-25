class Meal < ApplicationRecord
  belongs_to :restaurant
  validates :name, presence: true
  has_one_attached :photo
end
