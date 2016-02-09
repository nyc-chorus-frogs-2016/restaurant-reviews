
def sample_cuisine
  cuisines = ['American', 'Thai', 'French', 'Italian', 'Japanese', 'Mexican', 'Spanish', 'Vietnamese', 'Chinese']
  cuisines.sample
end

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.safe_email }
    username { Faker::Internet.user_name }
    password 'pw123456'
  end

  factory :restaurant do
    association :creator, factory: :user
    name { Faker::Company.name }
    cuisine { sample_cuisine }
    address { Faker::Address.street_address}
  end

  factory :review do
    association :reviewer, factory: :user
    association :restaurant
    rating { [1,2,3,4,5].sample }
    body { Faker::Hipster.paragraph }
  end

end
