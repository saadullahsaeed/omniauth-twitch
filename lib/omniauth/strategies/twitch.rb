require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Twitch < OmniAuth::Strategies::OAuth2
      option :name, 'twitch'

      option :client_options, {
        :site => "https://api.twitch.tv/kraken",
        :authorize_url => "https://api.twitch.tv/kraken/oauth2/authorize",
        :token_url => "https://api.twitch.tv/kraken/oauth2/token"
      }

      uid { raw_info['_id'] }

      info do
        {
          name:  raw_info['name'],
          email: raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/user').parsed
      end

    end
  end
end
