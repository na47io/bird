class Post < ApplicationRecord
  has_many :replies, dependent: :destroy
  
  validates :body, presence: true
  validates :author, presence: true
end
