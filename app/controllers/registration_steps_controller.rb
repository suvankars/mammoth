class RegistrationStepsController < ApplicationController
 include Wicked::Wizard

  steps :address, :contact, :financial
  
  def show
    @supplier = Supplier.find(params[:supplier_id])
    @address = @supplier.address.new() 
    @contact = Contact.new
    @finance = Finance.new
    render_wizard
  end

  def update
    @supplier = Supplier.find(params[:supplier_id])
    
    case step

    when :address
      @supplier = @supplier.address.new(address_params) 
    when :contact
      @supplier = @supplier.build_contact(contact_params)
    when :financial
      @supplier = @supplier.create_finance(finance_params)
        
    end
      
    render_wizard @supplier
  end

   private
    def set_supplier
      #@supplier = Supplier.last#find(params[:id])
      #@contact = @supplier.build_contact
      #@addresses = @supplier.address.all
      #@finance = @supplier.finance
    end


    def contact_params
      params.require(:contact).permit(:email, :telephone, :fax, :mobile, :website, :skype, :supplier_id)
    end

    def address_params
      params.require(:address).permit(:id, :name, :pincode, :address_line_1, :address_line_2, :city, :state, :country, :supplier_id)
    end

    def finance_params
      params.require(:finance).permit(:price_list, :currency, :tax_code, :email, :registration_number, :payment_method, :credit_limit, :credit_lead_time , :bank_name, :account_number, :IFSC_code)
    end

    def finish_wizard_path
      supplier_path(@supplier)
    end
end
