FactoryBot.define do
  factory :order_address do
    postal_code      { Faker::Base.regexify(/^\d{3}-\d{4}$/) }
    area_id          { Faker::Number.between(from: 2, to: 48) }
    city             { Faker::Address.city }
    street_address   { Faker::Address.street_address }
    building_name    { "メゾン" + Faker::Address.community }
    phone_number     { "090#{Faker::Number.number(digits: 8)}" }
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
