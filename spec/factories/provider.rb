FactoryGirl.define do
  factory :provider, :class => Provider do
    name Faker::Name.name
    city Faker::GameOfThrones.city
    provider_type "Center"
    licensed true
    quality_rating 3
    zipcode "38601"
    coordinates "POINT(-89.49311759999999 34.4853103)"
  end
end
