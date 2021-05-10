RSpec.feature "Edit a job" do
  before do
    @john = User.find_by(id: 1)
    visit new_user_session_path
    fill_in "email", with: @john.email
    fill_in "password",  with: "111111"
    click_button "Log in"
    @job = Job.find_by(id: 2)
  end

  scenario "User edit a job" do
    visit job_path(@job.id)
    
    find("#Edit").click

    fill_in "Title", with: "Test job"
    fill_in "Description", with: "Job description"
    fill_in "Employer", with: "test d.o.o."
    fill_in "Email", with: "job@job.com"
    fill_in "Category", with: "test"
    click_button "Create job"

    expect(page).to have_content("Job was successfully updated")
    expect(page).to have_link("Back")
  end
end