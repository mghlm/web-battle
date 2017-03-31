require 'game'

describe Game do
  subject(:game) {described_class.new(player_1, player_2)}
  let(:player_1) {double(:player)}
  let(:player_2) {double(:player)}

  describe 'initialize' do
    it 'initializes with a new player 1' do
      expect(game.player_1).to eq player_1
    end

    it 'initializes with a new player 2' do
      expect(game.player_2).to eq player_2
    end

    it 'attacked player is player 2 at start' do
      expect(game.attacked_player).to eq player_2
    end

    it 'attacking player is player_1 as default' do
      expect(game.attacking_player).to eq player_1
    end
  end

  describe '#switch_player' do
    it 'set @attacking_player to other player' do
      game.switch_player
      expect(game.attacking_player).to eq player_2
    end
  end

  describe '#attack' do
    it "allows a player to attack another player" do
      allow(player_2).to receive(:hp) {10}
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end

  describe '#lose_message' do
    it "puts losing message for loser" do
      expect(game.lose_message(player_1)).to eq "#{player_1} loses!"
    end

    it "puts losing message only if attacked player HP is 0" do
      allow(player_2).to receive(:hp) {0}
      allow(player_2).to receive(:receive_damage)
      expect(game.attack(player_2)).to eq "#{player_2} loses!"
    end

    # it "displays lose message when player's HP is 0" do
    #   allow(player_2).to receive(:hp) {0}
    #   allow(player_2).to receive(:receive_damage) {nil}
    #   expect(game).to receive(:lose_message)
    #   game.attack(player_2)
    # end
  end

  end

end
