class Application < ApplicationRecord
  extend FriendlyId
  friendly_id :last_name, use: :slugged

  validates_presence_of :first_name, :last_name, :born_on, :email, :phone, :address, :education
  validates :phone, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  
  belongs_to :user
  belongs_to :job
  has_one_attached :cv_file

  accepts_nested_attributes_for :job

  scope :all_except, ->(user) { where(user_id: user.id) }

  


 
end
