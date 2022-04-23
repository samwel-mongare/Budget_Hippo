require 'rails_helper'

RSpec.describe CategoriesExpense, type: :model do
  context 'associations' do
    it { should belong_to(:category).class_name('Category') }
    it { should belong_to(:expense).class_name('Expense') }
  end
end
