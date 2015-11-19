class Subcategory < ActiveRecord::Base
  belongs_to :category
  validates :name, :description, presence: true
end
