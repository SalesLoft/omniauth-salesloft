require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class SalesLoft < OmniAuth::Strategies::OAuth2
      option :name, :salesloft

      option :client_options, {
        :site => "https://api.salesloft.com",
        :authorize_url => "https://accounts.salesloft.com/oauth/authorize",
        :token_url => "https://accounts.salesloft.com/oauth/token"
      }

      uid { raw_info["id"] }

      info do
        raw_info
      end

      def raw_info
        @raw_info ||= access_token.get("/public_api/v1/me.json").parsed
      end

      private

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
    end
  end
end

OmniAuth.config.add_camelization "salesloft", "SalesLoft"
