require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "Tom TT"
    email "tt.tt@tt.net"
    password "foobar"
    password_confirmation "foobar"
  end
end

FactoryGirl.define do
  sequence :email do |n|
  "person-#{n}@example.com"
  end
end