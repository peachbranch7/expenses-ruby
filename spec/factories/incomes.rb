FactoryBot.define do
  factory :income do
    price {Faker::Number.rand(1..100000000)}
    category {"給料"}
    memo {"2月分給料"}
    date { Faker::Date.between(from: '1930-01-01', to: '2050-12-31') }

    association :user
  end
end
