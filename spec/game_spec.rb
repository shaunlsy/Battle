require 'game'

describe Game do
  subject(:game){ described_class.new(shaun, lucian) }
    let(:shaun){ double(:player) }
    let(:lucian){ double(:player) }

  it 'retrieves player 1' do
    expect(game.player_1).to eq shaun
  end

  it 'retrieves player 2' do
    expect(game.player_2).to eq lucian
  end

  describe '#attack' do
    it 'attacks player and gives damages' do
      expect(lucian).to receive(:damage)
      game.attack(lucian) #game.attack instead of player 1 attacks player 2
    end
  end

end