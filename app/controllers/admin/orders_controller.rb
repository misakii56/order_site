class Admin::OrdersController < ApplicationController
  def show
        @order_product = Order.find(params[:id])
        @order_products = @order_product.order_products
  end
end
