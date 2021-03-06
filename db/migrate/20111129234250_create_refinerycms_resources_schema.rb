class CreateRefinerycmsResourcesSchema < ActiveRecord::Migration
  def up
    create_table :refinery_resource, :force => true do |t|
      t.string   "file_mime_type"
      t.string   "file_name"
      t.integer  "file_size"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "file_uid"
      t.string   "file_ext"
    end
  end

  def down
    [::Refinery::Resource].reject{|m|
      !(defined?(m) and m.respond_to?(:table_name))
    }.each do |model|
      drop_table model.table_name if model.table_exists?
    end
  end
end
