class Player
  attr_reader :named, :hp

  DEFAULT_HP=100

  def initialize(name, hp=DEFAULT_HP)
    @named = name
    @hp = hp
  end

  def reduce_hp
    self.hp -= 10
  end

  def attack(attacked_player)
    attacked_player.reduce_hp
  end

  private
  attr_writer :hp

end
