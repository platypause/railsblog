class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	validates :body, presence: true, length: { minimum: 5, maximum: 200 }
end
