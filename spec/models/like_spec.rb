require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.create(name: 'Peter', photo: '_url_', bio: 'Brewer', posts_counter: 0)
    post = Post.create(title: 'Test1', text: 'This is test', comments_counter: 0, likes_counter: 0, author_id: user.id)
    Like.new(author_id: user.id, post_id: post.id)
  end

  before { subject.save }

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'Should be valid' do
    expect(subject).to be_valid
  end
end
