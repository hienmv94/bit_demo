FactoryGirl.define do
  factory :member do
    name {Faker::Name.first_name}
    association :group, method: :group
  end
end
