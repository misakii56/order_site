class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
     @item = Item.new(item_params)
     @item.save
     redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
  end

  def edit
    @item = Item.find(params[:id])
    @genre = @item.genre
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

   private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end
end
