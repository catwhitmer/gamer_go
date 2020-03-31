class GamesController < ApplicationController
  
  get '/games/new' do 
    erb :new
  end
end
  