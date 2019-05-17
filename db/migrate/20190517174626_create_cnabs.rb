class CreateCnabs < ActiveRecord::Migration[5.2]
  def change
    create_table :cnabs do |t|
      t.text :file

      t.timestamps
    end
  end
end
