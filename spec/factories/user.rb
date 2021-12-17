FactoryBot.define do
  factory :user do
    username { "user_#{rand(1..999999)}" }
  end
end