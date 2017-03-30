class Game

  attr_reader :players, :attacking_player
  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @attacking_player = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(attacked_player)
    attacked_player.receive_damage
  end

  def switch_player
    self.attacking_player = attacked_player

  end

  def attacked_player
    players.select do |player|
      player != attacking_player
    end.first
  end

  private
  attr_writer :attacking_player
end
