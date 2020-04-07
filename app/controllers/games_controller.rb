class GamesController < ApplicationController
  
  get '/games' do 
    @games = Game.all
    erb :'/games/index'
  end
  
  get '/games/new' do 
    erb :'/games/new'
  end
  
  get '/games/:id' do 
    @game = Game.find_by_id(params[:id])
      erb :'/games/show'
  end
  
  post '/games' do 
    @game = Game.create(name: params[:name], genre: params[:genre], notes: params[:notes], user_id: current_user.id)
    redirect "/games/#{@game.id}"
  end
  
  get '/games/:id/edit' do
    @game = Game.find_by_id(params[:id])
      if @game
        erb :'/games/edit'
      else 
        redirect :'/login'
      end
  end
  
  patch '/games/:id' do
    @game = Game.find(params[:id])
      if logged_in? && !params[:name].empty?
        @game.update(name: params[:name], genre: params[:genre], notes: params[:notes])
      
        redirect "/games/#{@game.id}"
      else 
        redirect :'/'
    end
  end
  
  delete '/games/:id' do
    @game = Game.find_by_id(params[:id])
      if @game.destroy
        redirect '/games'
      else 
        redirect '/games'
      end
  end
end
