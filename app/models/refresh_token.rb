class RefreshToken < ActiveRecord::Base

  def self.refresh_token
    first ? first.refresh_token : ''
  end

end
