class Public::CustomersController < ApplicationController
  def show
     @customer = current_customer
      @items = Item.all
      @items = Item.all.page(params[:page]).per(8)
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
    
  end 
  
  def quit
  end

  def out
  end
  
     private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
