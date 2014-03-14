class CreateRefinerycmsSettingsSchema < ActiveRecord::Migration
  def up
    create_table :refinery_setting, :force => true do |t|
      t.string   "name"
      t.text     "value"
      t.boolean  "destroyable",             :default => true
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "scoping"
      t.boolean  "restricted",              :default => false
      t.string   "callback_proc_as_string"
    end

    add_index :refinery_setting, :name
  end

  def down
    [::Refinery::Setting].reject{|m|
      !(defined?(m) and m.respond_to?(:table_name))
    }.each do |model|
      drop_table model.table_name
    end
  end
end
