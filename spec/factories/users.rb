FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nick_name             {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaaa111"}
    password_confirmation {password}
    first_name            {person.last.kanji}
    last_name             {person.first.kanji}
    first_name_kana       {person.last.katakana}
    last_name_kana        {person.first.katakana}
    birth_date            {Faker::Date.birthday}
  end
end