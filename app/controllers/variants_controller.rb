class VariantsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end
  
  def new
    @product = Product.find(params[:product_id])
    @variant = @product.variants.new
    @tax_rates = TaxRate.all.map{|tr| [tr.tax_description, tr.id]}
    @default_tax_rate = [@product.tax_rate.tax_description, @product.tax_rate.id]
  end

end