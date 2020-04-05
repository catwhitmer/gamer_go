Sinatra Gamer Go app
This game library app provides a database and web interface for users to:

-Create an account which allows the user to see all the games currently in the library, and allows the user to manage their own.
-Each user can ONLY modify content of his/her own game.
-A user can create, read, update, and delete (CRUD) their games only.
-User inputs are validated by email presence and uniqueness.

This app was built with Sinatra, and with the use of ActiveRecord for storing information in a database.

Usage
1.clone repository
2.bundle install
3.rake db:migrate
4.shotgun
5.Then navigate to localhost:9393 in your browser to see it in action.

Contributing Bug reports and pull requests are welcome on GitHub athttps://github.com/catwhitmer/gamer_go . This project is intended to foster collaboration; contributors are expected to adhere to the Contributor Covenant code of conduct.

License This software is available as open source under the terms of the MIT License.