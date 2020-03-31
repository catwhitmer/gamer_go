class GamesController < ApplicationController
  
  get '/games/new' do 
    erb :'/games/new'
  end
  
  post '/games' do 
    if logged_in? && params[:name] != ""
      @games = Game.new(name: params[:name], genre: params[:genre)
      @games.save
      redirect "/games/#{@games.id}"
    else
      redirect '/'
    end
  end
end
  