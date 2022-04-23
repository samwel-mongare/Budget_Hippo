require 'rails_helper'

RSpec.describe 'Category show page', type: :feature do
  before :each do
    @user1 = User.create!(email: 'johndo@gmail.com', password: '123abc', name: 'John')
    @user2 = User.create!(email: 'janedoe@gmail.com', password: '123abc', name: 'Jane')
    @user3 = User.create!(email: 'peter@gmail.com', password: '123abc', name: 'Peter')

    visit '/users/sign_in'
    fill_in 'Email', with: 'johndo@gmail.com'
    fill_in 'Password', with: '123abc'
    click_button 'Log in'

    @category1 = Category.create!(name: 'test', icon: 'fa-home', user_id: @user1.id)
    @expense = Expense.create!(name: 'test', amount: 10, author_id: @user1.id)

    visit category_path(@category1.id)
  end

  it 'should have the following content' do
    expect(page).to have_content('Welcome, John')
    expect(page).to have_content('Budget Hippo')
    expect(page).to have_content('Sign Out')
  end
end
