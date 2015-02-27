class User < ActiveRecord::Base
  has_many :lists
  has_secure_password
  validates :email, :username, presence: true, uniqueness: true
  
end
