FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    banned { false }

    trait :banned do
      banned { true }
    end
  end
end
