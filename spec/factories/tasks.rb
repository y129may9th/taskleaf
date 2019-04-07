FactoryBot.define do
  factory :task do
    name { 'Write a Test' }
    description { 'prepare RSpec and Capybara and FactoryBot' }
    user
  end
end
