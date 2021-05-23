class BuyersController < ApplicationController

  def index
  end

  def new
    @buyer_destination = BuyerDestination.new
  end

  def create
    @buyer_destination = BuyerDestination.new(buyer_params)
    if @buyer_destination.valid?
      @buyer_destination.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buyer_params
    params.require(:buyer_destination).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

end
