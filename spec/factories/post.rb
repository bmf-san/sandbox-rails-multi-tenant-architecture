FactoryBot.define do
  factory :post do

    title {Faker::Lorem.sentence}
    content {Faker::Lorem.paragraph}
    user {FactoryBot.create(:user)}
    tenant {FactoryBot.create(:tenant)}

  end
end
