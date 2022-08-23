require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context '/index' do
    before(:each) { get user_posts_path(1) }

    it 'should return http code ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end
  end
end