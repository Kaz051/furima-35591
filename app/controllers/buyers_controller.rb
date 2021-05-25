class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @buyer_destination = BuyerDestination.new
  end

  def new
  end

  def create
    @buyer_destination = BuyerDestination.new(buyer_params)
    if @buyer_destination.valid?
      pay_item
      @buyer_destination.save
      redirect_to root_path
    else
       render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_destination).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.buyer.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end
