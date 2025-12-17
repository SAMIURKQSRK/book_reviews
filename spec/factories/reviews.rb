FactoryBot.define do
  factory :review do
    association :book
    association :user
    stars { 5 }
  end
end
