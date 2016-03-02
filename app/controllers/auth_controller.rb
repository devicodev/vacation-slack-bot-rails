class AuthController < ApplicationController

  def index
    @google_auth_url = GoogleClient.client(oauthcallback_url).authorization_uri
  end

  def oauthcallback
    GoogleClient.client.code = params[:code]
    RefreshToken.create(refresh_token: GoogleClient.client.fetch_access_token["refresh_token"])
    GoogleClient.client.refresh_token = RefreshToken.refresh_token
    render plain: "Success"
  end

end
