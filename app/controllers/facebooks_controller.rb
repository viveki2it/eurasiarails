class FacebooksController < ApplicationController
  
  def create
    auth = request.env['omniauth.auth']
    user = User.find_by_email(auth["extra"]["raw_info"]["email"])
    if user
      user.token = auth["credentials"]["token"]
      user.secret = auth['credentials']['secret']
      user.save
      sign_in(:user, user, :bypass => true)
      redirect_to root_path
    else
      user = User.new(:email => auth["extra"]["raw_info"]["email"],:provider => auth["provider"],:uid => auth["uid"],:token => auth["credentials"]["token"],:secret =>auth['credentials']['secret'],:picture => auth["info"]["image"])
      user.save(:validate => false)
      sign_in(:user, user, :bypass => true)
      redirect_to edit_setting_path(user)
    end
  end
end
