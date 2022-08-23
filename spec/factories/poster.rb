require 'faker'

FactoryBot.define do
  factory :poster do
    title { Faker::Lorem.sentence }
    featured { Faker::Lorem.sentence }
    brandName { Faker::Lorem.sentence }
    location { Faker::Lorem.sentence }
    transmission_type { Faker::Lorem.sentence }
    price { Faker::Number.number(7) }
    leased { Faker::Lorem.sentence }
    model_year { Faker::Number.number(4) }
    milage { Faker::Number.number(4) }
    fuel_type { Faker::Lorem.sentence }
    engine_capacity { Faker::Number.number(4) }
    mobile_number { Faker::Number.number(11) }
  end
end
