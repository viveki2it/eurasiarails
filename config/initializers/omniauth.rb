Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FB_APP_ID, FB_SEC_ID, {:scope => 'email, publish_actions, offline_access, publish_stream,read_stream'} if Rails.env=="development"
  provider :facebook, FB_APP_ID_P, FB_SEC_ID_P, {:scope => 'email, publish_actions, offline_access, publish_stream,read_stream'} if Rails.env=="production"
end