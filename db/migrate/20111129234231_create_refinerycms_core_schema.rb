class CreateRefinerycmsCoreSchema < ActiveRecord::Migration
  def up
    create_table :slug, :force => true do |t|
      t.string   "name"
      t.integer  "sluggable_id"
      t.integer  "sequence",       :default => 1, :null => false
      t.string   "sluggable_type", :limit => 40
      t.string   "scope",          :limit => 40
      t.datetime "created_at"
    end
  end

  def down
    [::Slug].reject{|m|
      !(defined?(m) and m.respond_to?(:table_name))
    }.each do |model|
      drop_table model.table_name
    end
  end
end
