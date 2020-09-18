class PaytmController < ApplicationController
    include PaytmHelper
    skip_before_action :verify_authenticity_token
    def start_payment
      @s = mobile_params
      @address1 = @s["address"]
      @id1 = @s["f"].to_i
      @data = Cart.find(@id1)
      @item = current_user.orders.build(name:@data.name,hotel:@data.hotel,foodtype:@data.foodtype,img:@data.img,describe:@data.describe,price:@data.price,address:@address1)
        if @item.save
            @data.destroy
        end
      start_payment = Paytm::StartPaymentService.new(params, request)
      start_payment.call
      @checksum = start_payment.checksum
      @paytmParam = start_payment.paytmParam
    end
  
    def verify_payment
      paytm_verify = Paytm::VerifyPaymentService.new(params, @cart)
      paytm_verify.call
      @paytmparams = paytm_verify.paytmparams
      @is_valid_checksum = paytm_verify.is_valid_checksum
      @some = Order.last()
      if @is_valid_checksum == true
        if @paytmparams["STATUS"] == "TXN_SUCCESS"
          redirect_to order_path(@some)
        else
          respond_to do |format|
            format.html
          end
        end
      end
    end

    private

    def mobile_params
      params.require(:order).permit(:address,:f)
    end

end
