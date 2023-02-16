class Public::AddressesController < ApplicationController
  def index
     @customer = current_customer
     @address = Address.new
  end

  def edit
  end
end
