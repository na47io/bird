class Reply < ApplicationRecord
  belongs_to :post
  
  validates :body, presence: true
  validates :author, presence: true
end
