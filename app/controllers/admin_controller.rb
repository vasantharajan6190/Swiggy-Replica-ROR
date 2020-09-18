class AdminController < ApplicationController
  def index
    @items = Item.where(user_id:current_user)
  end

  def new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to admin_index_path
    else
      render "new"
    end
  end

  def destroy
    @f = Item.find(params[:id])
    @f.destroy
    redirect_to admin_index_path
  end

   private
   def item_params
    params.require(:item).permit(:hotel, :name, :describe, :foodtype, :price, :img)
  end
end
