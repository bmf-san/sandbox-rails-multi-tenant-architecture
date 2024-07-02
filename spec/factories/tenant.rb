FactoryBot.define do
  factory :tenant do

    name {Faker::Name.initials(number: 2)}
    domain {Faker::Internet.domain_name}

  end
end
