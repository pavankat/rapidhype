# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    title "MyText"
    url "MyText"
    description "MyText"
    channel nil
    language "MyString"
    avg_mon_imps 1
    alexa 1
    page_rank 1
    approved false
    desired_price 1.5
    user nil
  end
end
