require 'rails_helper'

RSpec.describe 'Post show', type: :system do
  before :each do
    @user = User.create(name: 'Tim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Coach')
    @post = Post.create(author: @user, title: 'Test', text: 'This is a test post')
    Comment.create(author: @user, post: @post, text: 'Test Comment')
    Like.create(post: @post, author: @user)
    visit user_post_path(@post.author, @post)
  end

  it 'shows post title' do
    expect(page).to have_content(@post.title)
  end

  it 'shows post author' do
    expect(page).to have_content(@post.author.name)
  end

  it 'shows number of comments' do
    expect(page).to have_content('Number of comments: ')
  end

  it 'shows number of likes' do
    expect(page).to have_content('Number of likes: 1')
  end

  it 'shows post content' do
    expect(page).to have_content(@post.text)
  end

  it 'shows the username of commentor' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the content of the comment left' do
    expect(page).to have_content('Test Comment')
  end
end
