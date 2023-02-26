class Admin::OrdersController < ApplicationController
  def show
        @order_product = Order.find(params[:id])
        @order_products = @order_product.order_products
        @customer = @order_product.customer
        @total = 0
  end
end
