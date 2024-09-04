class AddCustomFieldsToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :custom_fields, :jsonb, default: {}
  end
end
