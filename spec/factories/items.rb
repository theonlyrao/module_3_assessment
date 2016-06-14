FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "item#{n}" }
    sequence(:description) { |n| "description for item#{n}" }
    image_url "should be a url"
    created_at Time.now
    updated_at Time.now
  end

end
