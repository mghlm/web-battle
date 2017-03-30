feature "Testing Infrastructure" do
  # scenario "Checks that the page says hello" do
  #   visit('/')
  #   expect(page).to have_content 'Testing infrastructure working!'
  # end

  scenario "expects player1 to fill in their name" do
    sign_in_and_play
    expect(page).to have_content 'Nick'
  end

  scenario "expect player2 to fill in their name" do
    sign_in_and_play
    expect(page).to have_content 'JJ'
  end

  scenario "expects to see Player 2's Hit Points" do
    visit('/play')
    expect(page).to have_content("JJ: 100HP")
  end

  scenario "want to be able to attack player 2 and get confirmation" do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content('Nick attacked JJ')
  end

  # scenario "Want a button to take us back to play page after " do
  #   sign_in_and_play
  #   click_button("Attack")
  #   click_button('Ok')
  #   expect(page).to visit('/play')
  #
  # end


  scenario "expects to see Player 1s Hit Points" do
    sign_in_and_play
    expect(page).to have_content("Nick: 100HP")
  end

  scenario "want to be able to attack player 1 and get confirmation" do
    player_2_start_turn
    click_button('Attack')
    expect(page).to have_content("JJ attacked Nick")

  end


end
