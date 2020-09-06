FactoryBot.define do
  factory :purchase_car do
    car_type {"トヨタ プリウス"}
    car_number { "品川599 ら29-34" }
    user_id {Faker::Number.within(range: 1..10)}
    park_id {Faker::Number.within(range: 1..10)}
  end
end
