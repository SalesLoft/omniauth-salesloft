require "omniauth-oauth2"

module OmniAuth
  module Strategies
    module Salesloft < OmniAuth::Strategies::OAuth2
      option :name, :salesloft

      option :client_options, {
        :site => "https://accounts.salesloft.com",
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        raw_info
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/me.json")
      end
    end
  end
end
