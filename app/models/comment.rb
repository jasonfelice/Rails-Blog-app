class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :count_comments

  private

  def count_comments
    post.increment(:comments_counter)
  end
end
