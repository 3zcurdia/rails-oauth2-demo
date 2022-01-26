require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class MyAnimeList < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "my_anime_list"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options,
             site: 'https://myanimelist.net',
             authorize_url: '/v1/oauth2/authorize',
             token_url: '/v1/oauth2/token'\

      # You may specify that your strategy should use PKCE by setting
      # the pkce option to true: https://tools.ietf.org/html/rfc7636
      option :pkce, true
      # option :pkce_options, {
      #   code_challenge: proc { SecureRandom.alphanumeric(100) },
      #   code_challenge_method: "plain"
      # }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      # uid { raw_info['id'] }
      #
      # info do
      #   {
      #     :name => raw_info['name'],
      #   }
      # end
      #
      # extra do
      #   {
      #     'raw_info' => raw_info
      #   }
      # end
      #
      # def raw_info
      #   @raw_info ||= access_token.get('/v2/users/@me').parsed
      # end
    end
  end
end

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :my_anime_list, "49584d16e3184f310114edc5095efe31", "2815440eeba78e007547aabc250b8d089f767700a25d5db91e67d112b7981563"
end
