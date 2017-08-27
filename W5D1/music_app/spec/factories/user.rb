FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    session_token { Faker::Number.number(10) }
    password_digest { Faker::Pokemon.name }
  end
end
