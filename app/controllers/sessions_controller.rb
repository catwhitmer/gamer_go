class SessionsController < ApplicationController
  
  get '/signup' do 
    erb :signup
  end
  
  get '/login' do
    erb :login
  end
  
  get '/users/:id' do 
    @user = User.find_by_id(params[:id])
    erb :"/users/home"
  end
  
  post '/users' do 
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id

      redirect to "/users/#{@user.id}"
    else
      redirect to '/signup'
    end
  end
  
  post '/login' do 
    @user = User.find_by(email: params[:email])
    
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else
      redirect '/login'
    end
  end
  
  get '/logout' do
    session.clear
    redirect '/'
  end
  
end