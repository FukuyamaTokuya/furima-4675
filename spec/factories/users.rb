FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    # password {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password { 'ABab12' }
    password_confirmation { password }
    last_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    last_name_kana { Gimei.last.katakana }
    first_name_kana { Gimei.first.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: 5.years.ago) }
  end
end
