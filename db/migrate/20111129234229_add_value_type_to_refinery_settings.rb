class AddValueTypeToRefinerySettings < ActiveRecord::Migration
  def up
    add_column :refinery_setting, :form_value_type, :string
  end

  def down
    remove_column :refinery_setting, :form_value_type
  end
end
