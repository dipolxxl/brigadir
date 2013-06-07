FactoryGirl.define do
  factory :brigade do
    name    { "Brigade_#{Time.now.usec}" }
    workers 5
    cost    100
    association :country
  end

  factory :country do
    name { "Country_#{Time.now.usec}" }
  end
end