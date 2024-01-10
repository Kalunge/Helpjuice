FactoryBot.define do
  factory :search do
    query { "Sample Query" }
    ip_address { "127.0.0.1" }
  end
end
