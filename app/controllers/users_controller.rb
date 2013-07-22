class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample app"
      redirect_to @user # possible user_path(@user) also
    else
      @title = "Sign Up"
      render 'new'
    end
  end


end
