module Underlock
  class Base
    extend Dry::Configurable

    setting :private_key
    setting :public_key
    setting :passphrase
    setting :cipher

    class << self

      def encrypt(unencrypted_value)
        case unencrypted_value
          when File, Pathname   then FileEncryptor.new.encrypt(unencrypted_value)
          when String           then Encryptor.new.encrypt(unencrypted_value)
        end
      end

      def decrypt(encrypted_entity)
        encrypted_entity.decrypt
      end

    end
  end
end