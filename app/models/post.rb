class Post < ApplicationRecord
  has_many :replies, dependent: :destroy
  has_and_belongs_to_many :tags
  
  validates :body, presence: true
  validates :author, presence: true
end
