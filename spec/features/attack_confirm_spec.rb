require 'spec_helper'

describe Battle, type: :feature do

  feature 'Attacking' do
    scenario 'attack Player 2' do
      sign_in_and_play
      click_link 'Attack'
      expect(page).to have_content 'Alicia attacked Shaun'
    end
  end

end