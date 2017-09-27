class Car < ApplicationRecord
  validates :brand, presence: true
  validates :model, presence: true
  validates :garage, presence: true
end
