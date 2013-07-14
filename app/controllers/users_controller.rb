class UsersController < ApplicationController
  def new
    @title = "Sign Up"
  end
  def show
    @user = User.find_by_id(params[:id])
  end
end
