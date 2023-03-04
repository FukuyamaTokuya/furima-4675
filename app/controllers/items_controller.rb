class ItemsController < ApplicationController
  before_action :redirect_root, only: :new

  def index
  end

  def new
    @item = Item.new
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
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_fee_id, :place_id, :number_of_day_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
end
