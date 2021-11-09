FactoryBot.define do
  factory :post do
    sequence(:content) {|n| "Content #{n}"}
    association :user

    trait :most_recent do
      created_at { Time.now }
    end

    trait :old do
      created_at { 2.hours.ago }
    end

    trait :too_old do
      created_at { 3.years.ago }
    end
  end
end
