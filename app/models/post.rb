class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'

  after_create :update_post_counter

  def update_post_counter
    author.update(post_counter: author.posts.all.length)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
