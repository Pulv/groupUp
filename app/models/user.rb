class User < ApplicationRecord
  attr_accessor :remember_token

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


    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end 

    def authenticated(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
      update_attribute(:remember_digest, nil)
    end
end
