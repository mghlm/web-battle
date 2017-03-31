class Game

  attr_reader :players, :attacking_player

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @attacking_player = player_1
  end

  def self.create(player_1, player_2)
    @the_game = Game.new(player_1, player_2)
  end

  def self.instance
    @the_game
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def switch_player
    self.attacking_player = attacked_player
  end

  def attack(attacked_player)
    attacked_player.receive_damage
    lose_message(attacked_player) if attacked_player.hp <= 0
  end


  def attacked_player
    players.select do |player|
      player != attacking_player
    end.first
  end

  def lose_message(loser)
    "#{loser} loses!"
  end

  private
  attr_writer :attacking_player
end
