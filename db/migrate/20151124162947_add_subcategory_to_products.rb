class AddSubcategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :subcategory_id, :string
    add_column :products, :integer, :string
    add_column :products, :properties, :string
    add_column :products, :text, :string
  end
end
