require 'spec_helper'

describe Battle, type: :feature do
  feature 'Attacking' do
    scenario 'attack Player 2' do
      sign_in_and_play
      click_link 'Attack'
      expect(page).to have_content 'Alicia attacked Shaun'
    end

    scenario 'reduce Player 2 HP by 10' do
      sign_in_and_play
      click_link 'Attack'
      click_button 'OK'
      expect(page).not_to have_content 'Shaun: 100HP'
      expect(page).to have_content 'Shaun: 90HP'
    end

    scenario 'be attacked by Player 2' do
      sign_in_and_play
      click_link 'Attack'
      click_button 'OK'
      click_link 'Attack'
      expect(page).to have_content 'Alicia attacked Shaun'
    end

    # As Player 1,
    # So I can start to lose a game of Battle,
    # I want Player 2's attack to reduce my HP by 10
    scenario "reduce Player 1's HP by 10" do
      sign_in_and_play
      click_link 'Attack'
      click_button 'OK'
      click_link 'Attack'
      click_button 'OK'
      expect(page).not_to have_content 'Alicia: 100HP'
      expect(page).to have_content 'Alicia: 90HP'
    end
  end
end