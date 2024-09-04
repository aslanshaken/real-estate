class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :state
      t.string :zip
      t.references :client, foreign_key: true

      t.timestamps
    end
    add_index :buildings, [:address, :state, :zip], unique: true
  end
end
