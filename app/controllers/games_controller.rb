class GamesController < ApplicationController
  
  get '/games' do 
    if authorized?
    @games = Game.all
    erb :'/games/index'
  else
    redirect :'/login'
  end
  end
  
  get '/games/new' do 
    if authorized?
    erb :'/games/new'
  end
  end
  
  get '/games/:id' do 
    if @game = Game.find_by_id(params[:id])
      erb :'/games/show'
    else redirect :'/login'
    end
  end
  
  post '/games' do 
    if authorized?
      @game = Game.create(name: params[:name], genre: params[:genre], notes: params[:notes], user_id: current_user.id)
      redirect "/games/#{@game.id}"
    else
      redirect :'/login'
    end
  end
  
  get '/games/:id/edit' do
    @game = Game.find_by_id(params[:id])
      if authorized?
        erb :'/games/edit'
      else 
        redirect :'/login'
      end
  end
  
  patch '/games/:id' do
    if authorized
    @game = Game.find(params[:id])
      if logged_in? && !params[:name].empty?
        @game.update(name: params[:name], genre: params[:genre], notes: params[:notes])
      
        redirect "/games/#{@game.id}"
      else 
        redirect :'/'
      end
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
