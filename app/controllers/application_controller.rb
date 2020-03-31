require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sesions
    set :sesion_secret, "secret"
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
      !!current_user
    end
    
    def current_user
      User.find_by(id: session[:user_id])
    end
    
  end

end
