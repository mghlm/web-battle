feature "Testing HP" do

  scenario "HP is reduced by 10 after an attack" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content "HP:90"

  end

end
