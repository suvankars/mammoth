class Product < ActiveRecord::Base
  has_many :variants, :class_name => "Product", :foreign_key => "parent_id", dependent: :destroy
  belongs_to :parent, :class_name => "Product"
end