class CartController < ApplicationController
  def index
    @cartitem = Cart.where(user_id:current_user)
  end
 def destroy
  @f = Cart.find(params[:id])
  @f.destroy
  redirect_to cart_index_path
 end
end
