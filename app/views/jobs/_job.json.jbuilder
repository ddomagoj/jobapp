json.extract! job, :id, :title, :description, :employer, :email, :category, :created_at, :updated_at
json.url job_url(job, format: :json)