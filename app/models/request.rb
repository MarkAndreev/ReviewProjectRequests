class Request < ApplicationRecord
  validates :description, presence: true
  validates :rating, presence: true
end
