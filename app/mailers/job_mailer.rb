class JobMailer < ApplicationMailer
  def new_job_email
    @job = params[:job]
    mail(to: @job.email, subject: 'New job created')
  end
end
