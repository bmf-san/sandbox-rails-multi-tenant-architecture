FactoryBot.define do
  factory :user do

    name {Faker::Name.initials(number: 2)}
    email {Faker::Internet.email}
    password { "password" }
    tenant {FactoryBot.create(:tenant)}

  end
end
