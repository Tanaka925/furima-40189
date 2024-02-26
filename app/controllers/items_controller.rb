class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item = Item.order("created_at DESC")
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render_to :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :condition_id, :delivery_charge_id, :area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end