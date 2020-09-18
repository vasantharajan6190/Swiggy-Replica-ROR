include PaytmHelper
module Paytm
  class VerifyPaymentService
    attr_reader :keys,
                :paytmparams,
                :is_valid_checksum

    def initialize(attribute, cart)
      @attribute = attribute
      @keys = attribute.keys
    end

    def call
      paytm_params
    end

    private

    def paytm_params
      paytmparams = Hash.new
      @keys.each do |k|
        paytmparams[k] = @attribute[k]
      end
      @checksum_hash = paytmparams["CHECKSUMHASH"]
      paytmparams.delete("CHECKSUMHASH")
      paytmparams.delete("controller")
      paytmparams.delete("action")
      @paytmparams = paytmparams
      @is_valid_checksum = verify_checksum()
    end
  end
end