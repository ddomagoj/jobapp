RSpec.feature "Sign out signed-in user"  do
  before do
    @john = User.find_by(id: 1) 

    visit "/"
    find("#Login", match: :first).click
    fill_in "email", with: @john.email
    fill_in "password",  with: "111111"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
  end

  scenario do
    visit "/"
    find("#Logout", match: :first).click

    expect(page).to have_content("Signed out successfully.")
    expect(page).not_to have_link("Edit")
  end

end

