FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'password01' }
    password_confirmation { password }
    family_name           { '山田' }
    family_name_1         { 'ヤマダ' }
    first_name            { '圭佑' }
    first_name_1          { 'ケイスケ' }
    birthday              { Faker::Date.birthday }
  end
end
