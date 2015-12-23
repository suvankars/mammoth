class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :price
      t.decimal :base_price
      t.references :purchase_order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
