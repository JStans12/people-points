FactoryGirl.define do

  factory :user do
    sequence :name do |n|
      "user number #{n}"
    end

    password "password"
    points 10
    tokens 0

    factory :user_with_token do

      tokens 2
    end
  end

  factory :reward do

    sequence :id, [1,2,3,4,5,6,7,8,9,10].cycle do |n|
      n
    end

    sequence :name do |n|
      "reward number #{n}"
    end

    image_link "http://www.moes.com/public/images/food/junior-burritos/art-vandalay-jr.jpg"
  end

end
