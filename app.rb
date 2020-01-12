require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do 
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    # erb :play
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    @game.switch_playerrrrr
    erb :attack
  end

  get '/confirm_attack' do
    @game = $game
    erb :confirm_attack
  end

  get '/switch_attack' do
    @game = $game
    erb :play
  end

  run! if app_file == $0
end
