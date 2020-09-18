module PaytmHelper
    require 'paytm/encryption_new_pg.rb'
    include EncryptionNewPG
    def generate_checksum
      new_pg_checksum(@paytmParam,"%SoAmYtc!%E4s6DN").gsub("\n",'')
    end
  
    def verify_checksum
      new_pg_verify_checksum(@paytmparams, @checksum_hash, "%SoAmYtc!%E4s6DN")
    end
end
