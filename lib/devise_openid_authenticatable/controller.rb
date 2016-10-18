module DeviseOpenidAuthenticatable
  module Controller
    extend ActiveSupport::Concern

    protected
    def verify_authenticity_token_with_openid_response_check
      super unless openid_provider_response?
    end

    def openid_provider_response?
      !!request.env[Rack::OpenID::RESPONSE]
    end
  end
end

DeviseOpenidAuthenticatable.send(:prepend, DeviseOpenidAuthenticatable::Controller)
