class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @order_shipping = OrderShipping.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path if @item.order.present?
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

    private
    def order_params
      params.require(:order_shipping).permit(
        :postal_code, :tel, :address, :town, :prefecture_id, :mansion, :token).merge(
          user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end
  end

