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
    # @game.attack(@game.player_2)
    @game.attack(@game.opponent_of(@game.current_player))
    erb :attack
  end

  post '/switch_attack' do
    $game.switch_turns
    redirect('/play')
  end

   # start the server if ruby file executed directly
  run! if app_file == $0
end
