class BitbucketsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  def index
    @repos = set_bitbucket(current_user).repos
  end
  
  def show
  end
  
  def create 
  end

  private
  def set_bitbucket(user)
    bitbucket = BitBucket.new do |config|
  	  config.oauth_token   = user.oauth_token
  	  config.oauth_secret  = user.oauth_secret
  	  config.client_id     = Settings.BITBUCKET_CLIENT_ID
  	  config.client_secret = Settings.BITBUCKET_CLIENT_SECRET
  	  config.adapter       = :net_http
  	end
  end
end
