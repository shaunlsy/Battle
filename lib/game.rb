class Game
  attr_reader :current_player

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = player_1
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

  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end

  private
  attr_reader :players

end
