FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '000aaa' }
    password_confirmation { '000aaa' }
    last_name             { '中村' }
    first_name            { '豊' }
    last_name_kana        { 'ナカムラ' }
    first_name_kana       { 'ユタカ' }
    birthday              { '2020/10/01' }
  end
end
