include PaytmHelper
module Paytm
  class StartPaymentService
    attr :request,
         :paytmParam,
         :checksum

    def initialize(attribute, request)
      @request = request
    end

    def call
      get_param_list
    end

    private

    def get_param_list
      paytmParam = Hash.new
      paytmParam["MID"] = "JFMRzT03447545808157"
      paytmParam["ORDER_ID"] = "#{Time.now.to_i.to_s}"
      paytmParam["CUST_ID"] = "#{Time.now.to_i.to_s}"
      paytmParam["INDUSTRY_TYPE_ID"] =  Rails.application.secrets[:industry_type]
      paytmParam["CHANNEL_ID"] = Rails.application.secrets[:channel_web_ID]
      paytmParam["TXN_AMOUNT"] = 300
      paytmParam["WEBSITE"] = "WEBSTAGING"
      paytmParam["CALLBACK_URL"] =
        "#{request.protocol + request.host_with_port}/confirm_payment"
      @paytmParam=paytmParam
      @checksum=generate_checksum()
    end
  end
end