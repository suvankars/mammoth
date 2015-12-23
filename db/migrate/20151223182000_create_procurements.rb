class CreateProcurements < ActiveRecord::Migration
  def change
    create_table :procurements do |t|
      t.date :received_at
      t.references :purchase_order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
