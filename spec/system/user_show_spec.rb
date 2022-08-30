require 'rails_helper'

RSpec.describe 'User show', type: :system do
  before :each do
    @user = User.create(name: 'Tim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Coach')
    @post = Post.create(author: @user, title: 'Test', text: 'This is a test post')
    Comment.create(author: @user, post: @post, text: 'Test Comment')
    visit user_path(@user)
  end

  it 'has user profile picture' do
    expect(page).to have_content(@user.photo)
  end

  it 'shows username' do
    expect(page).to have_content(@user.name)
  end

  it 'shows number of posts' do
    expect(page).to have_content('Number of posts: 1')
  end

  it 'shows user\'s bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'shows first 3 posts' do
    expect(page).to have_content('Test')
  end

  it 'shows "See all posts" link' do
    expect(page).to have_content('See all posts')
  end

  it 'redirects to post page' do
    click_link @post.title
    expect(page).to have_current_path(user_post_path(user_id: @user.id, id: post.id))
  end

  it 'redirects to post/index when click see all posts' do
    click_link 'See all posts'
    expect(page).to have_current_path(user_post_path(@user))
  end
end
