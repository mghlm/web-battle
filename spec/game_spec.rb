require 'game'

describe Game do
  subject(:game) {described_class.new(player_1, player_2)}
  let(:player_1) {double(:player, hp: 100)}
  let(:player_2) {double(:player, hp: 100)}
  let(:dead_player) {double(:player, hp: 0)}

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
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

  describe '#lose_message' do
    it "puts losing message for loser" do
      expect(game.lose_message(player_1)).to eq "#{player_1} loses!"
    end

    it "puts losing message only if attacked player HP is 0" do
      allow(dead_player).to receive(:receive_damage)
      expect(game.attack(dead_player)).to eq "#{dead_player} loses!"
    end
  end



end
