class PurchaseOrdersController < ApplicationController
  before_action :set_po, only: [:show, :edit, :update, :destroy]
  def index
    @purchase_orders = PurchaseOrder.all
  end

  def new
    @purchase_order = PurchaseOrder.new
  end
  
  def show
  end
  
  def create
    @purchase_order = PurchaseOrder.new(po_params)

    if @purchase_order.save
      redirect_to @purchase_order, notice: 'Purchase Order saved successfully'
    else
      render :new
    end
  end

  def destroy
    @purchase_order.destroy
    redirect_to purchase_orders_url, notice: 'Purchase Order deleted successfully'
  end

  def update
    if @purchase_order.update(po_params)
      redirect_to @purchase_order, notice: 'Purchase Order deleted successfully'
    else
      render :edit
    end
  end

  private
    def set_po
      @purchase_order = PurchaseOrder.find(params[:id])    
    end

    def po_params
      params.require(:purchase_order).permit(:due_date, :email, :phone_number, :po_number, :procurement_status, :status, :tax_inclusive, :message, :supplier_id)
    end


end
