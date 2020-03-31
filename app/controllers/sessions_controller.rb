class SessionsController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
  post '/login' do 
    @user = User.find_by(email: params[:email], password_digest: params[:password])
    
    if  @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else
      redirect '/login'
    end
  end
  
  get '/signup' do 
    erb :signup
  end
  
  post '/users' do 
   @user = User.new(name: params["name"], email: params["email"], password: params["password"])
   @user.save
   session[:user_id] = @user.id
   redirect "/users/#{@user.id}"
  end
  
  get '/users/:id' do 
    @user = User.find_by_id(params[:id])
    redirect "/users/#{@user.id}"
  end
  
end