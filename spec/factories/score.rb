FactoryBot.define do
  factory :score do
    point { (0..100).to_a.sample }
    user
  end
end