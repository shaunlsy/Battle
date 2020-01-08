require 'player'
describe Player do 
  subject(:dave) {Player.new('Dave') }

  describe '#name' do 
    it 'returns the name' do 
      expect(dave.name).to eq 'Dave'
    end 
  end 

  describe '#dmg' do
    it 'gives damages by 10' do
      expect(Player::HIT_POINTS).to eq 100
      expect(subject.dmg).to eq 90 
    end
  end

end 
