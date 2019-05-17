FactoryBot.define do
  factory :store do
    name { Faker::Company.name }
    owner_name { Faker::BreakingBad.character }
  end
end
