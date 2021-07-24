FactoryBot.define do
  factory :item do
    name                        {Faker::Name.initials(number: 2)}
    description                 {Faker::Lorem.sentence}
    price                       {Faker::Number.number(digits: 7)}
    charge_id                   {3}
    category_id                 {3}
    status_id                   {3}
    prefecture_id               {3}
    shipment_id                 {3}

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
