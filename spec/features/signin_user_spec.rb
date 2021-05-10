RSpec.feature "Users sign in"  do
  before do
    @john = User.find_by(id: 1) 
  end

  scenario "With valid credentials" do
    visit new_user_session_path

    fill_in "email", with: @john.email
    fill_in "password",  with: "111111"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_link("Edit")
  end
end