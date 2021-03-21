FactoryBot.define do
  factory :short do
    url { Faker::Internet.url }
    slug { Faker::Number.number(digits: 5) }
    count { Faker::Number.number(digits: 2) }
    expire_date { Faker::Date.forward(days: 30) }
  end
end