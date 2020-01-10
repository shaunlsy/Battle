def sign_in_and_play
  visit('/')
  fill_in :player_1, with: "Alicia"
  fill_in :player_2, with: "Shaun"
  click_button "Submit"
end 
