class Public::ItemsController < ApplicationController
  def index
    @customer = current_customer
    @items = Item.all
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @customer = current_customer
     @item = Item.find(params[:id])
  end
end
