class Api::V1::CategoriesController < Api::V1::BaseController
  def index
    @subcategories = Subcategory.all
  end

  def show
    @subcategory = Subcategory.find(params[:id])
    products = @subcategory.products.all
    @variants = []
    
    products.each do |product|
      if product.has_variants?
        product.variants.all.each { |variant| @variants << variant }
      else
        @variants << product
      end
    end
    @variants
  end
end