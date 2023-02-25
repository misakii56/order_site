class Admin::HomesController < ApplicationController
  def top
         @order_products = Order.all.page(params[:page]).per(10)
  end
end
