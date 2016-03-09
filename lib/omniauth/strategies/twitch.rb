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
      
      def callback_url
        full_host + script_name + callback_path
      end

      def raw_info
        access_token.options[:mode] = :query
        # Twitch requires the token as a parameter named oauth_token
        @raw_info ||= access_token.get('user', headers: {'Authorization' => 'OAuth ' + access_token.token}).parsed
      end
    end
  end
end
