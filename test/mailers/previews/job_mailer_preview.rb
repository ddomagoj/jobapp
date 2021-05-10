# Preview all emails at http://localhost:3000/rails/mailers/job_mailer
class JobMailerPreview < ActionMailer::Preview
  def new_job_email
    JobMailer.with(job: Job.first).new_job_email
  end
end
