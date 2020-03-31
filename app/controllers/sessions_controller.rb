class SessionsController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
  post '/login' do 
    @user = User.find_by(email: params[:email], password_digest: params[:password])
    
    if user && @user.authenticate(params[:password])
      login[:user_id] = user.id 
      
    else
      redirect '/login'
    end
  end
  
end