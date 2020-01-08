require 'sinatra/base'
require_relative './lib/player'

class Battle < Sinatra::Base
  enable :Player

  get '/' do
    erb(:index)
  end
  
  post '/names' do
   $player_1 = Player.new(params[:player_1_name])
   $player_2 = Player.new(params[:player_2_name])
    # erb(:play)
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name 
    @player_2_name = $player_2.name
    @player_1_hp = $player_1.hp
    @player_2_hp = $player_2.hp
    erb(:play)
  end

  get '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    $player_1.attack($player_2) 
    erb :attack
  end

  get '/confirm_attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_1_hp = $player_1.hp
    @player_2_hp = $player_2.hp
    erb :confirm_attack
  end
  
  run! if app_file ==$0
end
