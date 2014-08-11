class User < ActiveRecord::Base
	#has id, name, email, created_date, updated_date.
	before_save { |user| user.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true,  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password 
	validates :password, length: { minimum: 6 }
end

