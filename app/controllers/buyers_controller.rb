class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buyer_destination = BuyerDestination.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_destination = BuyerDestination.new(buyer_params)
    if @buyer_destination.valid?
      @buyer_destination.save
      redirect_to root_path
    else
       render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_destination).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

end
