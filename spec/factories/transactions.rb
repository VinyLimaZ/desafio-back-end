FactoryBot.define do
  factory :transaction do
    kind { 1 }
    date_time { Time.local("2019", "05", "17", "11", "50", "13") }
    value { "12345" }
    document { "12345678901" }
    card { "1234567890123" }
    association :store
    association :cnab
  end
end
