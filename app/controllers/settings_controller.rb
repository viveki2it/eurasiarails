class SettingsController < ApplicationController
  
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Updated successfully!"
      redirect_to root_path
    else
      flash[:error] = "Updation failed!"
      render :action => :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit!
  end
end
