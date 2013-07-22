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
      sign_in(@user)
      redirect_to @user # possible user_path(@user) also
    else
      @title = "Sign Up"
      render 'new'
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    @title = "Edit user"
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User saved successfuly"
      redirect_to @user # possible user_path(@user) also
    else
      flash[:error] = "Error in user saving"
      @title = "Edit user"
      render 'edit'
    end


  end




end
