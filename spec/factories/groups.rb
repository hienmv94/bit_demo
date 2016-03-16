FactoryGirl.define do
  factory :group do
   	name {Faker::Lorem.word}
    user {FactoryGirl.create :user}
  end
end
