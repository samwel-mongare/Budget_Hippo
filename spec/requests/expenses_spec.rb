require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/expenses/new'
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe ExpensesController, type: :controller do
  context 'routes' do
    it { should route(:get, '/expenses/1').to(action: :show, id: 1) }
    it { should route(:post, '/expenses').to(action: :create) }
  end

  context 'GET #new' do
    before { get :new }

    it { should render_template('new') }
  end
end
