class Request < ApplicationRecord
  validates :description, presence: true
end
