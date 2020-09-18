class HomepageController < ApplicationController
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 

  def index
  end

  def new
  end

  def create
    @sample = mobile_params
    @generate = rand(10 ** 4)
    sendotp = @generate
    @genotp  =Otp.new(otpcode:@generate)
    require 'rubygems' 
    require 'twilio-ruby' 
    account_sid = 'ACaee7fdb632a978373799bd29384bc82f' 
    auth_token = '8c27aa0c2ebe5fcbfe4f6f360b4067bf' 
    @client = Twilio::REST::Client.new(account_sid, auth_token) 
    message = @client.messages.create( 
                                 body: sendotp, 
                                 from: '+12055397687',
                                 to: '+919677861286')
    if @genotp.save
      redirect_to homepage_path(@genotp)
    else
      render "new"
    end
  end

  def show
@otpcode = Otp.find(params[:id])
@id = params[:id]
  end

  def check
    @original = Otp.find(params[:id])
    @sample = get_some
    @original1 = @original.otpcode
    fromform = @sample["otpcode"].to_i
    fromdb = @original1
    if fromform == fromdb
     redirect_to new_user_session_path
    else
      redirect_to homepage_path(@original)
    end
  end

  private
  def get_some
    params.require(:otp).permit(:otpcode)
  end
  def mobile_params
   params.require(:otp).permit(:mobile)
 end
end
