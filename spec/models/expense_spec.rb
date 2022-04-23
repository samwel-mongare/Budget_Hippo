require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:categories_expenses) }
    it { should have_many(:categories).through(:categories_expenses) }
  end

  context 'values not empty' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end
end
