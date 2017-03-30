feature 'Switch turns' do
  scenario 'switches turn after an attack' do
    sign_in_and_play
    expect(page).to have_content("Nick's turn")
    click_button "Attack"
    visit ('/play')
    expect(page).to have_content("JJ's turn")
  end
end
