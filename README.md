# OmniAuth Twitch

Twitch OAuth 2 strategy for OmniAuth.

Supports the authorization code flow as per https://github.com/justintv/Twitch-API/blob/master/authentication.md

## Installation

Add the following line to your Gemfile:

```ruby
gem 'omniauth-twitch', git: 'git://github.com/adabei/omniauth-twitch.git'
```

Then `bundle install`.

## Usage

Add the middleware to your Rails app by creating an initializer in config/initializer/omniauth.rb:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitch, ENV['TWITCH_ID'], ENV['TWITCH_SECRET'], scope: 'user_read'
end
```

Specify which permissions you need using `scope` and a space seperated list.

## License

omniauth-twitch is released under the MIT license. See LICENSE for details.
