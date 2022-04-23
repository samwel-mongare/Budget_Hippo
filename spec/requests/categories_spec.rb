require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/categories/new'
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe CategoriesController, type: :controller do
  context 'routes' do
    it { should route(:get, '/categories/1').to(action: :show, id: 1) }
    it { should route(:post, '/categories').to(action: :create) }
  end

  context 'GET #new' do
    before { get :new }

    it { should render_template('new') }
  end
end
