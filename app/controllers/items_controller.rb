class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:user, :name, :price, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :image )
  end
end