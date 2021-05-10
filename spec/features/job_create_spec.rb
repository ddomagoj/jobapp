RSpec.feature "Creating a job" do
  before do
    @john = User.find_by(id: 1)
    visit new_user_session_path
    fill_in "email", with: @john.email
    fill_in "password",  with: "111111"
    click_button "Log in"
  end

  scenario "User create a job" do
    visit "/"

    find("#Jobs", match: :first).click
    click_link "New Job"

    fill_in "Title", with: "Test job"
    fill_in "Description", with: "Job description"
    fill_in "Employer", with: "test d.o.o."
    fill_in "Email", with: "job@job.com"
    fill_in "Category", with: "test"
    click_button "Create job"

    expect(page).to have_content("Job was successfully created, confirmation email was sent")
    expect(page).to have_link("Back")
  end
end
