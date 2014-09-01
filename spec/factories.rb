FactoryGirl.define do
  factory :user do
=begin
 	

    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
=end
  sequence(:name) { |n| "Person#{n}"}
  sequence(:email){ |n| "Person#{n}@example.org"}
  password "foobar"
  password_confirmation "foobar"

  factory :admin do
  	admin true
  end
 end
 factory :micropost do 
 	content 'Lorem ipsum'
 	user
 end
end