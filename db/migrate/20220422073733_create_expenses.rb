class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :amount, default: 0, null: false
      t.references :author, null: false, foreign_key: {to_table: 'users'}, index: true

      t.timestamps
    end
  end
end
