require 'player'

describe Player do

subject(:player1) {described_class.new("Nick")}
subject(:player2) {described_class.new("JJ")}

  it "expects the player to input a name" do
    expect(player1.named).to eq "Nick"
  end

  it "expects player's hp to be reduced by 10 after an attack" do
    player1.receive_damage
    expect{player1.receive_damage}.to change{player1.hp}.by(-10)

  end

  it "initializes with HP set to 100" do
    expect(player1.hp).to eq(100)
  end


end
