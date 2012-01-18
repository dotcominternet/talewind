# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_talewind_session',
  :secret      => '23221ad39d0d17b707cda3b9b1928a756ad18b3b5390b814938a532c319aa6fef2062c3c547538f11151f1a10c7b550d1a43d831623ec400dc497f9672ec54ae'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
