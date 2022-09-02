class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  after_save :count_post

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  private

  def count_post
    author.increment!(:posts_counter)
  end
end
