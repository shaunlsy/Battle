require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/attack'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do 
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    Attack.run(@game.opponent_of(@game.current_player))
    if @game.game_over?
      redirect '/game_over'
    else
      redirect '/attack'
    end    
  end

  get '/attack' do
    erb :attack
  end

  post '/switch_attack' do
    @game.switch_turns
    redirect('/play')
  end

  get '/game_over' do
    erb :game_over
  end

   # start the server if ruby file executed directly
  run! if app_file == $0
end
