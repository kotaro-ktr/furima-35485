class ItemsController < ApplicationController

  def index
    #@items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      render :index
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :status_id, :charge_id, :prefecture_id, :shipment_id).merge(user_id: current_user.id)
  end

end
