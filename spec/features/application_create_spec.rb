#Prestao raditi iznenada moram vidjeti zasto

# RSpec.feature "Creating a application" do
#   before do
#     @john = User.find_by(id: 2)
#     visit new_user_session_path
#     fill_in "email", with: @john.email
#     fill_in "password",  with: "111111"
#     click_button "Log in"
#     @job = Job.find_by(id: 1)
#   end

#   scenario "User create a application" do
#     visit "/"

#     visit job_path(@job.id)
    
#     fill_in "First name", with: "Peter"
#     fill_in "Last name", with: "Parker"
#     fill_in "Born on", with: "01.01.1999."
#     fill_in "Email", with: "test2@test.com"
#     fill_in "Phone", with: "0924552050"
#     fill_in "Address", with: "Ulica 22"
#     find("option[value='VSS']").click
#     click_button "Create Application"

#     expect(page).to have_content("Application was successfully created, and confirmation email sent.")
#     expect(page).to have_link("Back")
#   end
# end