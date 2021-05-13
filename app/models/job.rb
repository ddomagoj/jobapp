class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :description, :employer, :email, :category
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  # validate :check_email   Ukoliko se odkomentira provjerava da li mail stvarno postoji

  belongs_to :user
  has_many :applications

  accepts_nested_attributes_for :applications

  scope :find_jobs, ->(user) {
    if user
       where.not(user_id: user.id) 
    else
      all
    end
  }
  

  def job_belong?(user)
    self.user_id == user.id 
  end

  def job_applied?(user)
    Application.where(user_id: user.id, job_id: id).exists?
  end

  def job_expiered?
    previous_day = Date.today - 5.days
    previous_day >= self.created_at  
  end

  def expiered_application?
    previous_day = Date.today - 5.days
    self.created_at >= previous_day ?  "expiered" :  "not-expiered"
  end

  def job_days
    today = Date.today
    days = (today - self.created_at.to_date).to_i
    5 - days
  end


  # private def check_email
  #   uri = URI('https://emailvalidation.abstractapi.com/v1/?api_key=e682a07e72cf4770971500f246d551f1&email=ddespala@gmail.com')
  #   http = Net::HTTP.new uri.host, uri.port
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  #   request = Net::HTTP::Get.new uri
  #   response = JSON.parse http.request(request)

  #   if ! response['is_valid_format']['value'] || ! response['is_mx_found']['value'] || ! response['is_smtp_valid']['value']
  #     errors.add :email, 'is not valid'
  #   end
  # end


end
