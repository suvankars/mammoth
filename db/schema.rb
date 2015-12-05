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

ActiveRecord::Schema.define(version: 20151204035303) do

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
