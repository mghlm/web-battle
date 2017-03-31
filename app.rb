require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player1_name])
    player2 = Player.new(params[:player2_name])
    @game = Game.create(player1, player2)
    redirect('/play')
  end

before do
  @game = Game.instance
end
  get '/play' do
    erb(:play)
  end

  get '/attack' do
    @game.attack(@game.attacked_player)
    @game.switch_player
    erb(:attack)
  end

end
