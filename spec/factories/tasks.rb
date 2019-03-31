FactoryBot.define do
  factory :task do
    name { 'Writing a Test' }
    description { 'Prepare the RSpec & Capybara & FactoryBot' }
    user
  end
end
