class LandingpageController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

 def create
   @value = mobile_params
   @data= Search.new(name:@value["search"])
   if @data.save
   redirect_to map_path(@data)
   end
 end

  def show
    @data = Item.find(params[:id])
    @item = current_user.carts.build(name:@data.name,hotel:@data.hotel,foodtype:@data.foodtype,img:@data.img,describe:@data.describe,price:@data.price)
    if @item.save
      redirect_to cart_index_path
    else
      render "root"
    end
  end

  def map
    @value = Search.find(params[:id])
    @search = @value["name"].capitalize()
    @data = Item.where(name:@search)
    if @data.length() ==0
      @search1 = @search.capitalize()
      @data= Item.where(hotel:@search1)
    end

  end

  private
  def mobile_params
      params.require(:order).permit(:search)
    end

end
