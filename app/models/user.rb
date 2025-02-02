class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', class_name: 'Post'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 250 }

  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
