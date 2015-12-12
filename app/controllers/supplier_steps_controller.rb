class SupplierStepsController < ApplicationController

  include Wicked::Wizard
  steps :address, :contact, :financial

  def show
    render_wizard
  end
end
