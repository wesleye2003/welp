class User < ActiveRecord::Base
  has_secure_password
  
  has_many :restaurants
  has_many :reviews


  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
end