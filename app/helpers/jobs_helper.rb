module JobsHelper

  def show_application_form(job)
     if job.job_applied?(current_user)
      content_tag(:h3, "You applied for this job", class: "alert alert-warning")
     elsif job.job_expiered?
      content_tag(:h3,  "This job expiered", class: "alert alert-warning")
    elsif job.job_belong?(current_user)
      content_tag(:h3,  "You created this job ", class: "alert alert-warning")
    else
      render partial: 'form_application', job: job
     end 
    end
end
