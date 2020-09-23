class PurchaseCar
  include ActiveModel::Model
  attr_accessor :token, :car_type, :car_number, :user_id, :park_id

  with_options presence: true do
    validates :car_type
    validates :car_number
  end

  def save
    purchase = Purchase.create(user_id: user_id, park_id: park_id)
    Car.create(car_type: car_type, car_number: car_number, purchase_id: purchase.id)
  end
end
