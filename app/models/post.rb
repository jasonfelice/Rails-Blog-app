class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :count_post

  private

  def count_post
    author.increment!(:posts_counter)
  end
end
