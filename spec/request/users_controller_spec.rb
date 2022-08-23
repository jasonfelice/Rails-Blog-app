require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context '/index' do
    before(:each) { get users_path(1) }

    it 'should return http code ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should return the correct placeholder text' do
      expect(response.body).to include('Here is a list of users')
    end
  end
  context '/show' do
    before(:each) { get user_path(1, 1) }

    it 'should return http code ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'should return the correct placeholder text' do
      expect(response.body).to include('User Details')
    end
  end
end
