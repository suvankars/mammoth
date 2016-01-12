class Product < ActiveRecord::Base
  #attr_accessible :subcategory_id, :properties
  belongs_to :subcategory
  serialize :properties, Hash
  has_many :fields, class_name: "ProductField"
  accepts_nested_attributes_for :fields, allow_destroy: true
  belongs_to :supplier
end
