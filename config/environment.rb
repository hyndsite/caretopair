# Load the Rails application.
require File.expand_path('../application', __FILE__)

app_social_secrets = File.join(Rails.root, 'config', 'social', 'social_secrets.rb')
load(app_social_secrets) if File.exists?(app_social_secrets)
# Initialize the Rails application.
Caretopair::Application.initialize!
