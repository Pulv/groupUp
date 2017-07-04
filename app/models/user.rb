class User < ApplicationRecord
	has_many :groups, :through => :group_memberships
	has_many :group_memberships
	has_many :posts
	has_many :comments
end
