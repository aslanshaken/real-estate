class CreateBuildingCustomFields < ActiveRecord::Migration[5.2]
  def change
    create_table :building_custom_fields do |t|
      t.references :building, foreign_key: true
      t.references :custom_field, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
