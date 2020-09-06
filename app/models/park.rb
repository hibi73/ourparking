class Park < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments
  has_one :purchase

  with_options presence: true do
    validates :image
    validates :name
    validates :park_length
    validates :park_width
    validates :park_height
    validates :description
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :use_date
    validates :price, numericality: { only_integer: true,greater_than: 500, less_than: 999999}
  end

end
