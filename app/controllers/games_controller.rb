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
    if logged_in?
      @game = Game.create(name: params[:name], genre: params[:genre], notes: params[:notes], user_id: current_user.id)
      redirect "/games/#{@game.id}"
    else
      redirect :'/games/new'
    end
  end
  
  get '/games/:id/edit' do
    if logged_in?
      @game = Game.find_by_id(params[:id])
      erb :'/games/edit'
    else 
      redirect :'/login'
    end
  end
  
  patch '/games/:id' do
    if logged_in?
      @game = Game.find_by_id(params[:id])
      @game.name = params[:name]
      @game.genre = params[:genre]
      @game.notes = params[:notes]
      @game.save
      redirect "/games/#{@game.id}"
    else 
      redirect :'/'
    end
  end
  
  delete '/games/:id' do
    if current_user
      Game.find_by_id(params[:id]).destroy
      redirect '/games'
    else 
      redirect '/games'
    end
  end
end
