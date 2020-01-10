require 'game'

describe Game do
  subject(:game){ described_class.new }
  let(:shaun){ double(:player) }
  let(:lucian){ double(:player) }

  describe '#attack' do
    it 'attacks player and gives damages' do
      expect(lucian).to receive(:damage)
      game.attack(lucian) #game.attack instead of player 1 attacks player 2
    end
  end

end