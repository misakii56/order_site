class Public::ItemsController < ApplicationController
  def index
    @customer = current_customer
    #@items = Item.all.page(params[:page]).per(8)
    @items = Item.where(is_active: "true").page(params[:page]).per(8)

  end

  def show
    @customer = current_customer
     @item = Item.find(params[:id])
     @cart_item = CartItem.new
  end
end
