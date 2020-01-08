require 'sinatra/base'
require_relative './lib/player'

class Battle < Sinatra::Base
  enable :Player

  get '/' do
    erb(:index)
  end
  
  post '/names' do
   $player_1 = Player.new(params[:player_1_name])
   p $player_1
   $player_2 = Player.new(params[:player_2_name])
    # erb(:play)
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name 
    @player_2_name = $player_2.name 
    erb(:play)
  end

  get '/attack' do
    @player_1_name = $player_1.name 
    @player_2_name = $player_2.name
    @player_1_name.attack(@player_2_name) 
    erb :attack
  end

  run! if app_file ==$0
end
