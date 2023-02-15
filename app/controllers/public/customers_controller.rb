class Public::CustomersController < ApplicationController
  def show
     @customer = Customer.find(params[:id])
      @items = Item.all
      @items = Item.all.page(params[:page]).per(8)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def quit
  end

  def out
  end
end
