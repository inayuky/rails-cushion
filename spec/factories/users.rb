FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test#{n}"}
    sequence(:email) { |n| "test#{n}@example.com"}
    sequence(:password) { |n| "test#{n}password"}
  end
end