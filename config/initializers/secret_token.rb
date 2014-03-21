# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
SampleApp::Application.config.secret_key_base = 'e2f196cbf43b0232d2ff66aef2bd4e6ef9923e46ddfd56c07a7dfdc162867a895b8c3d5d050b866a26231f9a8a9d126e69592cfdb0baba4b0cbcd994e5a80d73'

# config/initializers/secret_token.rb
require 'securerandom'

def secure_token
 token_file = Rails.root.join('.secret')
 if File.exist?(token_file)
   # Use the existing token.
   File.read(token_file).chomp
 else
   # Generate a new token and store it in token_file.
   token = SecureRandom.hex(64)
   File.write(token_file, token)
   token
 end
end
SampleApp::Application.config.secret_key_base = secure_token
