class Public::OrdersController < ApplicationController
  def confirm
  @order = Order.new(order_params)
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def log
    @customer = current_customer
    @order = Order.new(order_params)
    @order.customer_id=current_customer.id
    @order.shopping_cost=800
    if params[:order][:select_address]=="0"
      @order.postal_code=current_customer.postal_code
      @order.address=current_customer.address
      @order.name=current_customer.last_name+current_customer.first_name
    elsif params[:order][:select_address]=="1"
      address=Address.find(params[:order][:address_id])
      @order.address=address.address
      @order.postal_code=address.postal_code
      @order.name=address.name
    elsif params[:order][:select_address]=="2"
      address=Address.new
      address.customer_id=current_customer.id
      address.name=params[:order][:name]
      address.postal_code=params[:order][:postal_code]
      address.address=params[:order][:address]
      address.save
      @order.address=address.address
      @order.postal_code=address.postal_code
      @order.name=address.name

    end
  end

  def thanx
  end

  def index
  end

  def show
  end

  def create
     @order = Order.new(order_params)
     @address.save
     redirect_to public_orders_log_path
  end
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method)
  end
end
