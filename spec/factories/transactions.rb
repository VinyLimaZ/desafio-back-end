FactoryBot.define do
  factory :transaction do
    kind { 1 }
    date { "2019-05-17" }
    time { "MyString" }
    value { "9.99" }
    person_document { "MyString" }
    card { "MyString" }
    store_name { "MyString" }
    store_owner_name { "MyString" }
    store { nil }
    cnab { nil }
  end
end
