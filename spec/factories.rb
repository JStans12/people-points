FactoryGirl.define do

  factory :user do
    sequence :name do |n|
      "user number #{n}"
    end

    password "password"
    image_link "stock image"
    points 10
  end

end
