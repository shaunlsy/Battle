require 'game'

describe Game do
  subject(:game){ described_class.new(shaun, lucian) }
  subject(:finished_game){ described_class.new(dead_player, lucian) }
    let(:shaun){ double :player, hp: 100 }
    let(:lucian){ double :player, hp: 100 }
    let(:dead_player){ double :player, hp: 0 }

  it 'retrieves player 1' do
    expect(game.player_1).to eq shaun
  end

  it 'retrieves player 2' do
    expect(game.player_2).to eq lucian
  end

  describe '#switch' do
    it 'starts with player 1' do
      expect(game.current_player).to eq shaun
    end
    it 'switches turn' do
      game.switch_turns
      expect(game.current_player).to eq lucian
    end
  end

  describe '#opponent_of' do
    it 'finds the opponent fo a player' do
      expect(game.opponent_of(shaun)).to eq lucian
      expect(game.opponent_of(lucian)).to eq shaun
    end
  end

  describe '#game_over' do
    it 'returns false if no-one is at 0HP' do
      expect(game.game_over?).to be false
    end

    it 'returns true if at least one player is at 0HP' do
      expect(finished_game.game_over?).to be true
    end
  end

  describe '#loser'do
    it 'returns a player on less than 0HP' do
      expect(finished_game.loser).to eq dead_player
    end
  end

end
