class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.all
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
    @contact = Contact.new
  end

  # GET /suppliers/1/edit
  def edit
    @contact = @supplier.contact
    if @contact.nil?
      @contact = Contact.new
    end
    @contact
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)
    supplier_contact = @supplier.build_contact(contact_params)  

    respond_to do |format|
      if supplier_contact.save
        format.html { redirect_to @supplier, notice: 'Supplier was successfully created.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update_contact
    if @supplier.contact.nil?
      @contact = @supplier.build_contact(contact_params)
      @contact.save
    else
      @contact.update(contact_params)
    end
  end
  
  def update
    
    else
      respond_to do |format|
        if @supplier.update(supplier_params) and update_contact
          format.html { redirect_to @supplier, notice: 'Supplier was successfully updated.' }
          format.json { render :show, status: :ok, location: @supplier }
        else
          format.html { render :edit }
          format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
      @contact = @supplier.contact
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:company, :code, :status, :description)
    end

    def contact_params
      params.require(:contact).permit(:email, :telephone, :fax, :mobile, :website, :skype, :supplier_id)
    end
end

