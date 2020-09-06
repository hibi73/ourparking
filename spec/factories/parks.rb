FactoryBot.define do
  factory :park do
    name {Faker::Lorem.sentence}
    park_length {Faker::Number.between(from: 1, to: 10)}
    park_width {Faker::Number.between(from: 1, to: 10)}
    park_height {Faker::Number.between(from: 1, to: 10)}
    description {Faker::Lorem.sentence}
    postal_code {"427-0025"}
    prefecture {"静岡県"}
    municipality {"島田市大井町"}
    house_number {"横井1-1-1"}
    building_name {"大井ハイツ"}
    phone_number {Faker::Number.leading_zero_number(digits: 11)}
    use_date {Faker::Date.between(from: '2020-01-01', to: '2040-12-31')}
    price {Faker::Number.within(range: 500..999999)}
    association :user
    
  end
end
