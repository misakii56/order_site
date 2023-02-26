class Public::HomesController < ApplicationController
   
  def top
   @items = Item.order(created_at: :desc).limit(4).where(is_active: "true")
   @customer = current_customer
  end

  def about
  end
  
end 