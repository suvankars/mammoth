# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151223190214) do

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.integer  "pincode"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "supplier_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "addresses", ["supplier_id"], name: "index_addresses_on_supplier_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "email"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "website"
    t.string   "fax"
    t.string   "skype"
    t.integer  "supplier_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "contacts", ["supplier_id"], name: "index_contacts_on_supplier_id"

  create_table "finances", force: :cascade do |t|
    t.string   "price_list"
    t.string   "currency"
    t.string   "tax_code"
    t.string   "email"
    t.string   "registration_number"
    t.string   "payment_method"
    t.integer  "credit_limit"
    t.integer  "credit_lead_time"
    t.string   "bank_name"
    t.integer  "account_number"
    t.string   "IFSC_code"
    t.integer  "supplier_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "finances", ["supplier_id"], name: "index_finances_on_supplier_id"

  create_table "line_items", force: :cascade do |t|
    t.integer  "quantity"
    t.decimal  "price"
    t.decimal  "base_price"
    t.integer  "purchase_order_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "line_items", ["purchase_order_id"], name: "index_line_items_on_purchase_order_id"

  create_table "procurements", force: :cascade do |t|
    t.date     "received_at"
    t.integer  "purchase_order_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "procurements", ["purchase_order_id"], name: "index_procurements_on_purchase_order_id"

  create_table "product_fields", force: :cascade do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "require"
    t.integer  "subcategory_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "product_fields", ["subcategory_id"], name: "index_product_fields_on_subcategory_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "skuid"
    t.string   "brand"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "subcategory_id"
    t.string   "integer"
    t.string   "properties"
    t.string   "text"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.date     "due_date"
    t.string   "email"
    t.string   "phone_number"
    t.string   "po_number"
    t.string   "procurement_status"
    t.string   "status"
    t.boolean  "tax_inclusive"
    t.text     "message"
    t.integer  "supplier_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "purchase_orders", ["supplier_id"], name: "index_purchase_orders_on_supplier_id"

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "suppliers", force: :cascade do |t|
    t.string   "company"
    t.string   "code"
    t.string   "status"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
