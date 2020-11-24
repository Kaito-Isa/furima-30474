class OrdersController < ApplicationController
  before_action :sold_out_item, only: [:index]
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
      unless current_user != @item.user 
      redirect_to root_path
      end
  end

  def new

  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:post_code, :area_id, :municipality, :house_number, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def sold_out_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end
end
