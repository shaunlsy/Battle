require 'spec_helper'

describe Battle, type: :feature do

  feature "Enter names" do
    scenario 'players fill in names' do
      visit('/')
      fill_in :player_1_name, :with => "Alicia"
      fill_in :player_2_name, :with => "Shaun"
      click_button "Submit"
      expect(page).to have_content("Alicia vs. Shaun")
    end
  end
end