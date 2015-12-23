class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.date :due_date
      t.string :email
      t.string :phone_number
      t.string :po_number
      t.string :procurement_status
      t.string :status
      t.boolean :tax_inclusive
      t.text :message
      t.references :supplier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
