class SessionsController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
end