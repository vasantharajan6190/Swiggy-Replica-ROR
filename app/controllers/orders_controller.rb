class OrdersController < ApplicationController

    def index
        @order_item = Order.where(user_id:current_user)
    end

    def new
    end

    def show
      @ordered_item = Order.find(params[:id])
      require 'geocoder'
      Geocoder.configure(lookup: :opencagedata, api_key: "887ad43e20e04081a44d6775ed0b7d63")
      @results = Geocoder.search(@ordered_item["address"])
      @result = @results.first
      puts "#{@result.latitude}, #{@result.longitude}" 
    end

    def create
        @s = mobile_params
        @address1 = @s["address"]
        @id1 = @s["f"].to_i
        @data = Cart.find(@id1)
        @item = current_user.orders.build(name:@data.name,hotel:@data.hotel,foodtype:@data.foodtype,img:@data.img,describe:@data.describe,price:@data.price,address:@address1)
        if @item.save
            @data.destroy
        redirect_to order_path(@item)
        end
    end

    def destroy
        @f = Order.find(params[:id])
        @f.destroy
        redirect_to orders_path
       end

    private
    def mobile_params
        params.require(:order).permit(:address,:f)
      end

end
