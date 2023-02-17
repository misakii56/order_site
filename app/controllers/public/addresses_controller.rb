class Public::AddressesController < ApplicationController
  
  def create
     @address = Address.new(address_params)
     @address.save
     redirect_to public_addresses_path
  end
  def index
     @address = Address.new
     @customer = current_customer
     @addresses = @customer.addresses
  end

  def edit
  end
  
  
   private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
