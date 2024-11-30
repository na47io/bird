class Reply < ApplicationRecord
  belongs_to :post
  
  validates :body, presence: true
  validates :author, presence: true

  after_create_commit -> { 
    broadcast_replace_to "posts",
    target: "replies_#{post.id}",
    partial: "posts/replies",
    locals: { post: post }
  }
end
