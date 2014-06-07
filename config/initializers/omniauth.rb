Rails.application.config.middleware.use OmniAuth::Builder do
  facebook_key = Rails.application.secrets.facebook_key
  facebook_secret= Rails.application.secrets.facebook_secret
  provider :facebook, facebook_key, facebook_secret, scope: "user_friends", display: "popup"
end