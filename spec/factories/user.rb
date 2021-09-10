FactoryBot.define do
  factory :user do
    name          {FFaker::Lorem.word}
    emails        {FFaker::Internet.email}
    password      {'secret123'}
  end
end