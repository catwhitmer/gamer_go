cat = User.create(name: "Cat", email: "cat@gmail.com", password_digest: "abcd")
tim = User.create(name: "Tim", email: "tim@gmail.com", password_digest: "qwerty")

Game.create(name: "Resident Evil", genre: "survival horror", user: cat)
Game.create(name: "Grandia 2", genre: "RPG", user: tim)
Game.create(name: "Splinter Cell", genre: "stealth", user: cat)
Game.create(name: "Star Wars Old Republic", genre: "MMO", user: tim)
Game.create(name: "Overwatch", genre: "MMO", user: tim)
Game.create(name: "Horizon Zero Dawn", genre: "action-adventure", user: cat)
