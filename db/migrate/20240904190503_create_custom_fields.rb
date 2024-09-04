class CreateCustomFields < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_fields do |t|
      t.string :name
      t.string :field_type
      t.json :values, default: {}
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
