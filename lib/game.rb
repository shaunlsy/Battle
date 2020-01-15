class Game
  attr_reader :current_player

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @players = [player_1, player_2]
    @current_player = player_1
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game ||= Game.new(@player_1, @player_2)
  end

  def player_1
    @players[0]
  end

  def player_2
    @players[1]
  end

  # def switch_players
  #   switch
  #   @current_player = @players[0]
  # end

  # def switch
  #   @temp = []
  #   @temp[0] = @players[0]
  #   @players[0] = @players[1]
  #   @players[1] = @temp[0]
  #   @players
  # end

  def switch_turns
    @current_player = opponent_of(current_player)
  end

  def opponent_of(player)
    players_who_are_not(player).first
  end

  # return true or false when there's a losing player 
  # (one of the player reaches 0HP first)
  def game_over?
    losing_players.any?
  end

  def loser 
    losing_players.first
  end

  private
  attr_reader :players
  
  # select and return the player that reaches 0HP first
  def losing_players
    @players.select { |player| player.hp <= 0 }
  end

  def players_who_are_not(the_player)
    players.select{ |player| player != the_player }
  end

end
