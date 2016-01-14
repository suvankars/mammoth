class Product < ActiveRecord::Base
  belongs_to :subcategory
  serialize :properties, Hash
  has_many :fields, class_name: "ProductField"
  accepts_nested_attributes_for :fields, allow_destroy: true
  belongs_to :supplier
  belongs_to :brand
  belongs_to :tax_rate
end
