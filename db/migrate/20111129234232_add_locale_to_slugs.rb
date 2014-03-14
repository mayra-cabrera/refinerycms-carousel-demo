class AddLocaleToSlugs < ActiveRecord::Migration
  def up
    add_column :slug, :locale, :string

    add_index :slug, :locale
  end

  def down
    remove_column :slug, :locale
  end
end
