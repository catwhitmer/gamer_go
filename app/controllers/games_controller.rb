class GamesController < ApplicationController
  
  get '/games/new' do 
    erb :'/games/new'
  end
  
  post '/games' do 
    if logged_in? && params[:name] != ""
      @games = Game.create(name: params[:name], genre: params[:genre], user_id: current_user.id)
      redirect "/games/#{@games.id}"
    else
      redirect '/'
    end
  end
end
