class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :count_likes

  private

  def count_likes
    post.increment!(:likes_counter)
  end
end
