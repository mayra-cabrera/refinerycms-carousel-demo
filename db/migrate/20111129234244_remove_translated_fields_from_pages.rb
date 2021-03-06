class RemoveTranslatedFieldsFromPages < ActiveRecord::Migration
  def up
    Refinery::Page.translated_attribute_names.map(&:to_sym).each do |column_name|
      remove_column Refinery::Page.table_name, column_name if Refinery::Page.column_names.map(&:to_sym).include?(column_name)
    end

    Refinery::Page.reset_column_information
  end

  def down
    Refinery::Page.translated_attribute_names.map(&:to_sym).each do |column_name|
      if (translated_column = Refinery::Page.translation_class.columns.detect{|c| c.name.to_sym == column_name})
        add_column Refinery::Page.table_name, column_name, translated_column.type
      end
    end

    Refinery::Page.reset_column_information
  end
end
