require 'spec_helper'

describe Battle, type: :feature do
  feature 'switch turn' do
    scenario 'checks the current player for the first turn' do
      sign_in_and_play
      expect(page).to have_content "Alicia's turn"
    end

    scenario 'switch turns to Player 2' do
      sign_in_and_play
      click_link 'Attack'
      click_button 'OK'
      expect(page).not_to have_content "Alicia's turn"
      expect(page).to have_content "Shaun's turn"
    end
  end
end