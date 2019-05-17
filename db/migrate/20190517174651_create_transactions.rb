class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :kind
      t.date :date
      t.string :time
      t.decimal :value
      t.string :person_document
      t.string :card
      t.string :store_name
      t.string :store_owner_name
      t.references :store, foreign_key: true
      t.references :cnab, foreign_key: true

      t.timestamps
    end
  end
end
