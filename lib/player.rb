class Player
  attr_reader :named, :hp

  DEFAULT_HP=100

  def initialize(name, hp=DEFAULT_HP)
    @named = name
    @hp = hp
  end

  def receive_damage
    self.hp -= 10
  end

  private
  attr_writer :hp

end
