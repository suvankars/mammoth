class Api::V1::CategoriesController < Api::V1::BaseController
  def index
    @subcategories = Subcategory.all
  end
end