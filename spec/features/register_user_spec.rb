RSpec.feature "Register users" do
  scenario "with valid credentials" do
    visit new_user_registration_path
    a = Array.new(5){[*"a".."z"].sample}.join
    fill_in "Email", with: "#{a}@user6.com" 
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Password", with: "111111"
    find("#kita").set "111111"
    click_button "Sign up"

    expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  
    path_regex = /(?:"https?\:\/\/.*?)(\/.*?)(?:")/    

    email = ActionMailer::Base.deliveries.last
    path = email.body.match(path_regex)[1]
    visit(path)

    expect(page).to have_content("Your email address has been successfully confirmed.")

  end

  scenario "with invalid credentials" do
    visit new_user_registration_path
    fill_in "Email", with: ""
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Password", with: "111111"
    find("#kita").set "111111"
    click_button "Sign up"

    expect(page).to have_content("Sign up")
  end
end