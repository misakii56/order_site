class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
     redirect_to public_cart_items_path

  end
  def index
    @cart_items = current_customer.cart_items
    @customer = current_customer
    @total = 0
  end

  def destroy
  end

  def all_destroy
  end
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end