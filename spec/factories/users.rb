FactoryBot.define do
  factory :user do
    name {'test'}
    email {'test@co.jp'}
    password {'testtest'}
    password_confirmation {'testtest'}
    profile {'こんにちは！僕はtestと言います！'}
    affiliation {'ふくいITカレッジ'}
    post {'しがないITエンジニア'}

  end
end
