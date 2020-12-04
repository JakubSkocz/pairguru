FactoryBot.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }    
    confirmed_at { Time.now }
  end

  factory :comment do
    association :user
    association :movie    
    description { Faker::Lorem.sentence(3, true) }
    rating { Faker::Number.between(from: 0, to: 5) }
  end
end

