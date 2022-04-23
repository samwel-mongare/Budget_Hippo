require 'rails_helper'

RSpec.describe 'Category index page', type: :feature do
  before :each do
    @user1 = User.create!(email: 'johndo@gmail.com', password: '123abc', name: 'John')
    @user2 = User.create!(email: 'janedoe@gmail.com', password: '123abc', name: 'Jane')
    @user3 = User.create!(email: 'peter@gmail.com', password: '123abc', name: 'Peter')

    visit '/users/sign_in'
    fill_in 'Email', with: 'johndo@gmail.com'
    fill_in 'Password', with: '123abc'
    click_button 'Log in'

    visit '/categories'
  end

  it 'should have the following content' do
    expect(page).to have_content('Welcome, John')
    expect(page).to have_content('Budget Hippo')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Hello! No categories found. Please add one')
  end

  it 'should link up to page to add new category' do
    click_link 'Add Category'
    expect(current_path).to eq(new_category_path)
  end
end
