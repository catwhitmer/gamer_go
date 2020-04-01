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
      erb :'/games/show'
  end
  
  get '/games/:id/edit' do
    @game = Game.find_by_id(params[:id])
      erb :'/games/edit'
  end
  
  patch '/games/:id' do
    @game = Game.find_by_id(params[:id])
    @game.update(name: params[:name], genre: params[:genre])

      redirect "/games/#{@game.id}"
  end
  
  delete '/games/:id' do
    Game.find(params[:id]).destroy
    redirect '/games'
  end
end
