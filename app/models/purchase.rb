class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :park
  has_one :car
end
