FactoryBot.define do
  factory :prototype do
    name        { 'サンプル' }
    catch_copy  { 'テストしよう！' }
    concept     { 'テストしています' }
    association :user

    after(:build) do |prototype|
      prototype.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
