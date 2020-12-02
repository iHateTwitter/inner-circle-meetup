FactoryBot.define do
  factory :meetup do
    host { nil }
    title { "MyString" }
    description { "MyText" }
    url { "MyString" }
    meetup_type { "MyString" }
    participants_limit { 1 }
  end
end
