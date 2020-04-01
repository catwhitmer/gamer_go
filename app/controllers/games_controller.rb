class GamesController < ApplicationController
  
  get '/games/new' do 
    erb :'/games/new'
  end
  
  post '/games' do 
    if logged_in?
      @game = Game.create(name: params[:name], genre: params[:genre], user_id: current_user.id)
      redirect "/games/#{@game.id}"
    else
      redirect :'games/new'
    end
  end
  
  get '/games/:id' do 
    @game = Game.find_by_id(params[:id])
    if @game
      erb :'/games/show'
    else
      #show all games
    end
  end
end
