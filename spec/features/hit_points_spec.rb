require 'spec_helper'

describe Battle, type: :feature do

  feature "Viewing hit points" do
    scenario 'shows hit points' do
      visit('/')
      fill_in :player_1_name, with: "Alicia"
      fill_in :player_2_name, with: "Shaun"
      click_button "Submit"
      expect(page).to have_content("Shaun: 100HP")
      expect(page).to have_content("Alicia: 100HP")
    end
  end

end