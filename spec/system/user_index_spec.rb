require 'rails_helper'

RSpec.describe 'User show', type: :system do
  before :each do
    @user = User.create(name: 'Falcon', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Businessman')
    visit users_path
  end

  it 'shows all users' do
    expect(page).to have_content(@user.name)
  end

  it 'shows profile picture of every user' do
    expect(page).to have_content(@user.photo)
  end

  it 'shows number of posts of user' do
    expect(page).to have_content('Number of posts: 0')
  end

  it 'redirect to user details page' do
    click_link 'Picture'
    expect(page).to have_current_path user_path(@user)
  end
end
