#spec/factories/users.rb

FactoryGirl.define do
  factory :user do 
    email 'me@example.com'
    username 'booger'
    password '123'
    password_confirmation '123'
  end
end