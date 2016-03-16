FactoryGirl.define do
  factory :assignment do
   	name {Faker::Lorem.word}
    repo_name {Faker::Lorem.word}
    due_date {Faker::Date.between(5.days.ago, Date.today)}
    association :group, method: :group
    association :user, method: :user
  end
end
