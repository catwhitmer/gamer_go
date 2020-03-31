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
   @user = User.create(name: params[:name], email: params[:email], password: params[:password])
   @user.save
   redirect "/users/#{@user.id}"
  end
  
  get '/users/:id' do 
    @user = User.find_by_id(id: params[:id])
    erb :"/users/home"
  end
  
end