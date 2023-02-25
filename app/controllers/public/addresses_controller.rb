class Public::AddressesController < ApplicationController

  def create
     @address = Address.new(address_params)
     @address.customer_id = current_customer.id
     @address.save
     redirect_to public_addresses_path
  end
  def index
     @address = Address.new
     @customer = current_customer
     @addresses = @customer.addresses
  end

  def edit
     @customer = current_customer
     @address = Address.find(params[:id])
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to public_addresses_path
  end

   private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
