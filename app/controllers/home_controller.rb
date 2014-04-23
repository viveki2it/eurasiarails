class HomeController < ApplicationController
  
  def index
    if current_user
      @pages = FbGraph::User.me(current_user.token).accounts
    end
  end
end
