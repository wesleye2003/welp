class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :critics, through: :reviews, source: :user

  validates :name, :cuisine, :city, :state, :address, :zip, presence: true
end
