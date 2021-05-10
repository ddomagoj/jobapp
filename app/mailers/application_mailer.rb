class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  default to: -> { Application.pluck(:email)} 
  layout 'mailer'

  def new_application_email
    @application = params[:application]
    
    mail(to: @application.job.email, subject: 'New application created')
  end
  def new_application_email2
    @application = params[:application]
    
    mail(to: @application.email, subject: 'New application created')
  end

  
end
