
def sign_in_and_play
  visit('/')
  fill_in('player1_name', :with => 'Nick')
  fill_in('player2_name', :with => 'JJ')
  click_button('Submit')
end

def player_2_start_turn
  sign_in_and_play
  click_button('Attack')
  click_button('Ok')
end

def attack_and_confirm
  click_button 'Attack'
  click_button 'Ok'
end 
