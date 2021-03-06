class ApplicationController < Sinatra::Base

 configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "game_secret"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end
  
    def current_user
      @user ||= User.find_by_id(session[:user_id]) if logged_in?
    end
    
    def authorized?(t)
      logged_in? && t.user == current_user
    end
  end
end
