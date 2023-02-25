class Public::OrdersController < ApplicationController
  def confirm
  @order = Order.new(order_params)
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def log
    @cart_items = current_customer.cart_items
     @total = 0
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

  def show
         @order_product = Order.find(params[:id])
         @order_products = @order_product.order_products
  end

  def create
     @order = Order.new(order_params)
     @order.customer_id = current_customer.id
     if @order.save
         current_customer.cart_items.each do |cart_item|
           order_product = OrderProduct.new
           order_product.item_id = cart_item.item_id
           order_product.order_id = @order.id
           order_product.amount = cart_item.amount
           order_product.price = cart_item.item.price
           order_product.save
         end
         current_customer.cart_items.destroy_all
         redirect_to public_orders_thanx_path
     end
  end
  
  def index
    @order_products = current_customer.orders
  end
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method)
  end
end
