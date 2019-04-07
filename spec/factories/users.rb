FactoryBot.define do
  factory :user do
    nickname              {"abc"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    email                 {"test@gmail.com"}
  end
end
