FactoryGirl.define do
  factory :application do
    name { Faker::Lorem.word }
    url { Faker::Internet.url }
    user
  end
end
