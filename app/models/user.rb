class User < ApplicationRecord
	has_many :groups, :through => :group_memberships
	has_many :group_memberships
	has_many :posts
	has_many :comments


	# User input restrictions
  	validates :name,  presence: true, length: { within: 3..20 }
  	
  	before_save { self.email.downcase! }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, confirmation: true, length: { :within => 6..20 }
end
