class Api::V1::ProductsController < Api::V1::BaseController
  def show
    @product = Product.find(params[:id])
  end
end