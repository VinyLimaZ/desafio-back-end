class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :kind
      t.datetime :date_time
      t.integer :value
      t.string :document
      t.string :card
      t.references :store, foreign_key: true
      t.references :cnab, foreign_key: true

      t.timestamps
    end
  end
end
