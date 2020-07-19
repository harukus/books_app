class UsersController < ApplicationController
  def show
    if current_user.id.to_s != params[:id]
      redirect_to books_path
      return
    end
    @user = User.find(params[:id])
  end
end
