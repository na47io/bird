class Post < ApplicationRecord
  has_many :replies, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :body, presence: true
  validates :author, presence: true

  after_save :process_hashtags

  private

  def process_hashtags
    # Find all hashtags in the body (starting with # and ending in whitespace or end of string)
    hashtags = body.scan(/#\w+(?=\s|$)/)

    # Create or find tags and associate them with the post
    hashtags.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      tags << tag unless tags.include?(tag)
    end
  end
end
