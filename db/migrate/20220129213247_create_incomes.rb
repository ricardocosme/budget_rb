class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.string :name
      t.float :amount
      t.references :month, null: false, foreign_key: true

      t.timestamps
    end
  end
end
