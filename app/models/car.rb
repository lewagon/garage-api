class Car < ApplicationRecord
  include ActiveModel::Serializers::Xml

  validates :brand, presence: true
  validates :model, presence: true
  validates :garage, presence: true
end
