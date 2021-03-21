FactoryBot.define do
  factory :country do
    ip_add { Faker::Internet.ip_v4_address }
    name { Faker::Address.country_code }
    short
  end
end