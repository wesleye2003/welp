class Review < ActiveRecord::Base
 	belongs_to :user
 	belongs_to :restaurant

 	validates :rating, :body, presence: true
end
