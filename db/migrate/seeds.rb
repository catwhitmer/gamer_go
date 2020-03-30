User.create(name: "Cat", email: "cat@gmail.com", password: "abcd")
User.create(name: "Tim", email: "tim@gmail.com", password: "28dd82")

Game.create(name: "Resident Evil", genre: "survival horror", user_id: cat.id)
Game.create(name: "Grandia 2", genre: "RPG", user_id: tim.id)
Game.create(name: "Splinter Cell", genre: "stealth", user_id: cat.id)
Game.create(name: "Star Wars Old Rebuplic", genre: "MMO", user_id: tim.id)
Game.create(name: "Overwatch", genre: "MMO", user_id: tim.id)
Game.create(name: "Prince Of Persia", genre: "action-adventure", user_id: cat.id)
