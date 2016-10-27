UserReward.destroy_all
User.destroy_all
Reward.destroy_all

USERS = ["Joey", "Ryan", "Daniel", "Mike", "David", "Noah", "Anna"]

flower = Reward.create(name: "flower", image_link: "http://m.rgbimg.com/cache1t3WQU/users/m/mz/mzacha/600/nGLHesg.jpg")
poop = Reward.create(name: "poop", image_link: "http://viralsocially.com/images/15/March/20/9f016f2bde05357ddf1ecc46876ba03b.jpeg")
ruby = Reward.create(name: "ruby", image_link: "https://avatars2.githubusercontent.com/u/210414?v=3&s=400")

USERS.each do |user|
  User.create(name: user, password: "password", points: 10, tokens: 0, rewards: [flower])
end

User.find_by(name: "Daniel").rewards << poop
User.find_by(name: "Mike").rewards << ruby
