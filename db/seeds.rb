UserReward.destroy_all
User.destroy_all
Reward.destroy_all

USERS = ["Joey", "Ryan", "Daniel", "Mike", "David", "Noah", "Anna"]

tina = Reward.create(name: "tina", image_link: "https://pbs.twimg.com/profile_images/424545820701380608/yPzDOtaS.jpeg")
poop = Reward.create(name: "poop", image_link: "http://viralsocially.com/images/15/March/20/9f016f2bde05357ddf1ecc46876ba03b.jpeg")
ruby = Reward.create(name: "ruby", image_link: "https://avatars2.githubusercontent.com/u/210414?v=3&s=400")
cookie = Reward.create(name: "cookie", image_link: "https://lh6.ggpht.com/0O-HefMHNwemt4gnJ4YfNq3xFaTBaiFcwIRiUpzDZ1KObI8ptEMgoHOSDiy_tumRWexz=w300")
coffee = Reward.create(name: "coffee", image_link: "http://wholegrove.com/wp-content/uploads/2013/09/Cafe-Latte.jpg")
job = Reward.create(name: "job", image_link: "https://www.imore.com/sites/imore.com/files/styles/large/public/field/image/2014/03/topic_steve_jobs.png?itok=X2pO1JND")
f_girl = Reward.create(name: "factory girl", image_link: "http://www.femalefirst.co.uk/image-library/square/250/f/factory-girl-poster.jpg")
horse = Reward.create(name: "horse", image_link: "https://codepo8.github.io/canvas-images-and-pixels/img/horse.png")
militia = Reward.create(name: "berserker", image_link: "http://vignette3.wikia.nocookie.net/ageofempires/images/0/06/VBRSK.jpg/revision/latest?cb=20141203022445")
burrito = Reward.create(name: "burrito", image_link: "http://www.moes.com/public/images/food/junior-burritos/art-vandalay-jr.jpg")

USERS.each do |user|
  User.create(name: user, password: "password", points: 10, tokens: 0, rewards: [])
end

User.find_by(name: "Daniel").rewards << poop
User.find_by(name: "Mike").rewards << ruby
