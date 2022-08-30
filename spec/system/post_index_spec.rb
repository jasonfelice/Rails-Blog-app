require 'rails_helper'

RSpec.describe 'Post index', type: :system do
  before :each do
    @user = User.create(name: 'Tim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Coach')
    @post = Post.create(author: @user, title: 'Test', text: 'This is a test post')
    Comment.create(author: @user, post: @post, text: "Test Comment")
  end

  it "shows the username" do
    expect(page).to have_content(@user.name)
  end

  it "shows the profile picture" do
    expect(page).to have_content(@user.photo)
  end

  it "shows number of posts" do
    expect(page).to have_content("Number of posts: 1")
  end

  it 'shows post title' do
    expect(page).to have_content(@post.title)
  end

  it 'shows post content' do
    expect(page).to have_content(@post.text)
  end

  it 'shows comments' do
    expect(page).to have_content('Test comment')
  end

  it 'shows likes' do
    expect(page).to have_content('Number of likes: 0')
  end

  it 'redirects to the show page' do
    click_link(@post.title)
    expect(page).to have_content(@post.text)
  end
end
