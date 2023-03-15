FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    Faker::Config.locale = :ja
    post_code { Faker::Address.postcode }
    place_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    house_name { Faker::Address.secondary_address }
    phone_number { '09012345678' }
  end
end
