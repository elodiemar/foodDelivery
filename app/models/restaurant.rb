class Restaurant < ApplicationRecord
  has_many :meals, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo
end
