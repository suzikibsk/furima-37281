FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.unique.email }
    password              { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation {password}
    last_name             {'鈴木'}
    first_name            {'美香'}
    last_name_kana        {'スズキ'}
    first_name_kana       {'ミカ'}
    birth_day              { "1997-12-14" }
  end
end