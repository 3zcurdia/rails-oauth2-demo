class SessionController < ApplicationController
  # If you're using a strategy that POSTs during callback, you'll need to skip the authenticity token check for the callback action only.
  skip_before_action :verify_authenticity_token, only: :create

  def create
    binding.break
    # @user = User.find_or_create_from_oauth(auth_hash)
    # self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
