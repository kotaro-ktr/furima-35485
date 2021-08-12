class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :user_check

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

    private

    def set_item
      @item = Item.find(params[:item_id])
    end

    def user_check
      redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
    end

    def order_params
      params.require(:order_shipping).permit(
        :postal_code, :tel, :address, :town, :prefecture_id, :mansion, :token).merge(
          user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end
  end

