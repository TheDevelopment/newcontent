# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_new_content_session',
  :secret      => '7d589167c456885a654b9488298488ee64c5628440c6a2c595ce37d5a2a7850fe160bf6ecb8778c8cfab002931e0b2e94113c5437dbdddce8b092672f9522436'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
