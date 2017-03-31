feature "Testing HP" do

  scenario "Player 1's HP is reduced by 10 after an attack" do
    sign_in_and_play
    attack_and_confirm
    click_button("Attack")
    expect(page).to have_content "Nick HP:90"

  end

  scenario "Player 2's HP is reduced by 10 after an attack" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content "JJ HP:90"
  end

  scenario "Lose message when player 2 reaches 0 HP" do
    sign_in_and_play
    20.times do
      attack_and_confirm
    end
    expect(page).to have_content "JJ loses!"
  end
end
