feature 'Game over' do
  context 'when Player 1 reaches 0 HP first' do
    before do
      sign_in_and_play
      18.times{ attack_and_confirm }
      # allow(Kernel).to receive(:rand).and_return(100) # what's this
    end

    scenario 'Player 1 loses' do
      click_button 'Attack'
      expect(page).to have_content 'Shaun loses!'
    end
  end
end