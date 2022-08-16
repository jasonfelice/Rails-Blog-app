class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :count_post

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  private

  def count_post
    author.increment!(:posts_counter)
  end
end
