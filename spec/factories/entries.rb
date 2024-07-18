FactoryBot.define do
  factory :entry do
    number { Faker::Number.unique.between(from: 1, to: 1000) }
    title { Faker::Lorem.sentence }
    points { Faker::Number.between(from: 1, to: 5000) }
    comments { Faker::Number.between(from: 1, to: 1000) }
  end
end
