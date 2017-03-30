feature "Testing HP" do

  scenario "Player 1's HP is reduced by 10 after an attack" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content "HP:90"

  end

  scenario "Player 2's HP is reduced by 10 after an attack" do


  end

end
